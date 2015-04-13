require 'spec_helper'

describe User do
  let(:valid_attributes) {
      {
        first_name: 'billaros',
        last_name: 'psyllaros',
        email: 'test_billaros@gmail.com',
        password: '12345',
        password_confirmation: '12345',
      }    
    }
  
  context "validations" do
    let(:user){User.new(valid_attributes)}
    
    before do
      User.create(valid_attributes)
    end
    
    it 'requires an email' do
      expect(user).to validate_presence_of(:email)
    end
    
    it 'requires a unique email' do 
      expect(user).to validate_uniqueness_of(:email)
    end
    
    it "requires a unique email (case insensitive)" do
      user.email = 'BILLAROS@GMAI.COM'
      expect(user).to validate_uniqueness_of(:email)
    end
    
    it 'requires a unique email address to look like an email address' do
      user.email = 'billaros'
      expect(user).to_not be_valid
    end
    
  end
  
  describe '#downcase_email' do 
    it 'makes email attribute lowercase' do
      user = User.new(valid_attributes.merge(email: 'TEST@GMAIL.COM'))
      #user.downcase_email
      #expect(user.email).to eq('test@gmail.com')
      expect{user.downcase_email}.to change{user.email}.
                                      from('TEST@GMAIL.COM').
                                      to('test@gmail.com')
    end
    
     it 'downcases an email before saving' do
      user = User.new(valid_attributes)
      user.email = 'TESTBILLAROS@GMAIL.COM'
      expect(user.save).to be_true
      expect(user.email).to eq('testbillaros@gmail.com')
    end
    
  end
 
end
