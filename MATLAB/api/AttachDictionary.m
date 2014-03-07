function attachDictionary( YAML, workflow, dictionary )
% if workflow is empty then work on the raw
% dict goes in the top level of YAML
%
% if workflow has a value then look for the workflow name
if numel( workflow ) == 0;
    cc = {'output'};
    israw = true;
else
    cc = {'workflow', 'output'};
    israw = false;
end

if ~exist( dictionary, 'file')
    dict = CreateDictionary( YAML, [], dictionary);
    t = clock;
    dict.url = sprintf( '/%i/%0.2i/%0.2i/%s.html',t(1),t(2),t(3),dictionary)
end


% run over the aggregate values
if israw
    YAML.dict = dictionary;
else
    for ii = 1 : numel( YAML.aggregate )
        if isfield( YAML.aggregate{ii}, 'workflow' )
            for jj = 1 : numel( YAML.aggregate{ii}.workflow )
                wf = fliplr( strtok( fliplr( YAML.aggregate{ii}.workflow{jj}.native ), '/' ) );
                if strcmp( wf, workflow )
                    YAML.aggregate{ii}.workflow{jj}.dict = dictionary;
                end
            end
        end
    end
    
    for ii = 1 : numel( YAML.spatial)
        if isfield( YAML.spatial{ii}, 'workflow' )
            for jj = 1 : numel( YAML.spatial{ii}.workflow )
                wf = fliplr( strtok( fliplr( YAML.spatial{ii}.workflow{jj}.native ), '/' ) );
                if strcmp( wf, workflow )
                    YAML.spatial{ii}.workflow{jj}.dict = dictionary;
                end
            end
        end
    end
end

system('git checkout gh-pages')
WriteYaml( fullfile( '_data',horzcat(dict.name,'.yml')), dict );
dictpage = sprintf( '%i-%0.2i-%0.2i-%s.markdown',t(1),t(2),t(3),dictionary);
fo = fopen( fullfile( '_posts', dictpage ),'w'   );
fprintf( fo, '---\n');
fprintf( fo, 'layout: dictionary\n', dictpage );
fprintf( fo, 'title:  %s\n', dictionary );
fprintf( fo, '---\n');
fclose(fo)
system('git checkout master -f')