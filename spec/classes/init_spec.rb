require 'spec_helper'

describe 'beuser' do

  describe 'Presets as normal' do

    it { should include_class('beuser') }

    it {
      should contain_package( 'beuser' ).with( {
        'ensure'  => 'present',
        'name'    => 'beuser',
      } )
    }
  end

  describe 'Changed package name' do

    let :params do
      {
        :ensure       => 'present',
        :package_name => 'beuser_test',
      }
    end

    it { should include_class('beuser') }

    it {
      should contain_package( 'beuser' ).with( {
        'ensure'  => 'present',
        'name'    => 'beuser_test',
      } )
    }
  end

  describe 'Set to absent' do

    let :params do
      {
        :ensure         => 'absent',
        :package_name   => 'beuser',
      }
    end

    it { should include_class('beuser') }

    it {
      should contain_package( 'beuser' ).with( {
        'ensure'  => 'absent',
        'name'    => 'beuser',
      } )
    }
  end
end
