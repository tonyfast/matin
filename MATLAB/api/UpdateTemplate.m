function UpdateTemplate(issudo)

if nargin == 0 || issudo
    strstart = 'sudo';
else
    strstart = '';
end

system(sprintf('%s git fetch upstream',strstart));
system(sprintf('%s git merge upstream/master',strstart));
system(sprintf('%s git commit -m "UpdateTemplate merged updates to the forked repo."',strstart));