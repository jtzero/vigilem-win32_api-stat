require 'vigilem/win32_api/stat'

describe Vigilem::Win32API::Stat do
  
  
  it 'will have added the default after required' do
    expect(Vigilem::Core::Stat.all).not_to be_empty
  end
  
  context 'default contructor,' do
    
    describe '#gem_name' do
      it 'defaults to vigilem-win32_api-stat' do
        expect(subject.gem_name).to eql('vigilem-win32_api')
      end
    end
    
    describe '#api_check?' do
      it 'will return true if kernel.dll is found' do
       
      end
      
      it 'will return false when the platform is not an mswin' do
        
      end
    end
    
    describe '#available?' do
      it 'will return true as long as api_check? is true' do
        allow(subject).to receive(:api_check?) { true }
        expect(subject.available?).to be_truthy
      end
      
      it 'will return false when api_check? is false' do
        allow(subject).to receive(:api_check?) { false }
        expect(subject.available?).to be_falsey
      end
      
    end
  end
  
end
