require File.dirname(__FILE__) + '/kanbanpad/kanbanpad-api'

%w{ kanbanpad ticket project comment }.each do |f|
  require File.dirname(__FILE__) + '/provider/' + f + '.rb';
end

