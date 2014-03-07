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

system(sprintf('%s git init', strstart ) );
system(sprintf('%s touch README.md', strstart ) );
system(sprintf('%s git add README.md', strstart ) );
system(sprintf('%s git commit -m "First Commit"', strstart ) );
% system(sprintf('%s git remote rm origin', strstart) );
system(sprintf('%s git remote add origin %s', strstart, newrepo ) );
system(sprintf('%s git remote add upstream %s', strstart, 'https://github.com/tonyfast/matin.git' ) );
system(sprintf('%s git pull upstream master', strstart));
system(sprintf('%s git rm MATLAB -r --cached', strstart));
system(sprintf('%s git commit -m "Merge Master and remove MATLAB files"', strstart));
system(sprintf('%s git push origin master', strstart));
system(sprintf('%s git branch gh-pages', strstart));
system(sprintf('%s git checkout gh-pages', strstart));
system(sprintf('%s git pull upstream gh-pages', strstart));
system(sprintf('%s git commit -m "Initialize GitHub pages"', strstart));
system(sprintf('%s git push origin gh-pages', strstart));
system(sprintf('%s git checkout master', strstart));

