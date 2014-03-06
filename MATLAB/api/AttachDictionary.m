function YAML = attachDictionary( YAML, workflow, dictionary )
% if workflow is empty then work on the raw
% dict goes in the top level of YAML
%
% if workflow has a value then look for the workflow name
persistent crap

numel(crap)

if numel( workflow ) == 0;
    cc = {'output'};
    israw = true;
else
    cc = {'workflow', 'output'};
    israw = false;
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
