require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MovieHelper. For example:
#
# describe MovieHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MoviesHelper, type: :helper do
  describe '#oddness' do
    it 'define even or odd' do
      @count = 1
      helper.oddness(@count).should eql('odd')
    end
  end
end
