require 'spec_helper'

describe TodoItems do
  it { should belong_to(:todo_list) } 
 
end
