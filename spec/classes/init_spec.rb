require 'spec_helper'

describe 'beuser' do

  describe 'with default values for parameters' do

    it { should contain_class('beuser') }

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

    it { should contain_class('beuser') }

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

    it { should contain_class('beuser') }

    it {
      should contain_package( 'beuser' ).with( {
        'ensure'  => 'absent',
        'name'    => 'beuser',
      } )
    }
  end

  describe 'with invalid path for adminfile' do

    let :params do
      {
        :adminfile => 'not/a/valid/path',
      }
    end

    it 'should fail' do
      expect {
        should contain_class('beuser')
      }.to raise_error(Puppet::Error)
    end
  end

  describe 'with invalid provider' do

    let :params do
      {
        :provider => '!invalid-provider-name'
      }
    end

    it 'should fail' do
      expect {
        should contain_class('beuser')
      }.to raise_error(Puppet::Error,/beuser::provider is <!invalid-provider-name>, which does not match regex for an acceptable name./)
    end
  end

  describe 'with invalid path for source' do

    let :params do
      {
        :source => 'not/a/valid/path',
      }
    end

    it 'should fail' do
      expect {
        should contain_class('beuser')
      }.to raise_error(Puppet::Error)
    end
  end
end
