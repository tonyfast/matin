function PublishDataset( YAML )

system( 'git checkout gh-pages')
t = clock;
datapage = sprintf( '%i-%0.2i-%0.2i-%s.markdown',t(1),t(2),t(3),YAML.title);
WriteYaml( fullfile( '_posts',horzcat(YAML.title,'.yml')), YAML );
fo = fopen( fullfile( '_posts', datapage ),'w' );
fprintf( fo, '---\n');
s = fileread( horzcat(YAML.title,'.yml') );
fprintf( fo,'%s', s );
fprintf( fo, '---\n');
fclose(fo)

% system( 'git checkout master')