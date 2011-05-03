require File.dirname(__FILE__) + '/spec_helper.rb'

def tidy(fname)
  File.unlink(fname)
end

def image_size(fname)
  %x{file #{fname}} =~ /([0-9]+ x [0-9]+)/
  return $1
end


describe Websnapshot do
  describe 'take' do
    it 'returns a saved file name in relative form' do
      fname = Websnapshot.take('spec/testpage_960x640.html')
      fname.should == 'snapshot.png'
      tidy fname
    end

    context 'only a URL is specified' do
      context 'the URL is point to a local file' do
        it "saves 960x640 snapshot.png for 960x640 page without any options" do
          fname = Websnapshot.take('spec/testpage_960x640.html')
          fname.should == 'snapshot.png'
          image_size(fname).should == '960 x 640'
          tidy fname
        end
      end

      context 'the URL is point to a remote file (http)' do
      end

      context 'the URL is point to a remote file (https)' do
      end
    end

    context 'a URL and size options are specified' do
    end

    context 'a specified URL cannot be loaded' do
    end
  end

end
