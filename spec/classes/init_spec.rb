require 'spec_helper'

describe 'beuser' do

  describe 'with default values for parameters' do

    it { should include_class('beuser') }

    it {
      should contain_package( 'beuser' ).with( {
        'ensure' => 'present',
        'name'   => 'beuser',
      } )
    }
  end

  describe 'with custom values for parameters' do

    let :params do
      {
        :ensure       => 'present',
        :package_name => 'beuser_test',
        :adminfile    => '/net/nfsserv1/beuser-adminfile',
        :provider     => 'sun',
        :source       => '/net/nfsserv1/beuser-1.0.pkg',
      }
    end

    it { should include_class('beuser') }

    it {
      should contain_package( 'beuser' ).with( {
        'ensure'    => 'present',
        'name'      => 'beuser_test',
        'adminfile' => '/net/nfsserv1/beuser-adminfile',
        'provider'  => 'sun',
        'source'    => '/net/nfsserv1/beuser-1.0.pkg',
      } )
    }
  end

  describe 'with ensure absent' do

    let :params do
      {
        :ensure         => 'absent',
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
