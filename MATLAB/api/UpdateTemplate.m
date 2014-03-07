function UpdateTemplate(issudo)

if nargin == 0 || issudo
    strstart = 'sudo ';
else
    strstart = '';
end

system(sprintf('%s git fetch upstream'));
system(sprintf('%s git merge upstream/master'));