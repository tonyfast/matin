function GitHubSetUp( newrepo, issudo );

if ~exist( 'issudo', 'var')
    issudo = false;
end

if issudo 
    strstart = 'sudo ';
else
    strstart = '';
end

%% Create a README.md file for first commit

system(sprintf('%s git init', strstrat ) );
system(sprintf('%s touch README.md', strstrat ) );
system(sprintf('%s git add README.md', strstrat ) );
system(sprintf('%s git commit -m "First Commit"', strstrat ) );
system(sprintf('%s git remote add %s', strstrat, newrepo ) );
system(sprintf('%s git remote add upstream %s', strstrat, 'https://github.com/tonyfast/matin.git' ) );

