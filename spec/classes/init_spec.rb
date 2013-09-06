require 'spec_helper'

describe 'beuser' do

  describe 'Solaris should include beuser binary' do

    let :facts do
      {
        :osfamily                => 'Solaris',
        :operatingsystemrelease  => '10',
      }
    end

    it { should include_class('beuser') }

    it {
      should contain_file( 'beuser' ).with( {
        'ensure' => 'present',
        'path'   => '/bin/beuser',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '4755',
      } )
    }
  end

  describe 'Suse should include beuser binary' do

    let :facts do
      {
        :osfamily          => 'Suse',
        :operatingsystemrelease  => '10',
      }
    end

    it { should include_class('beuser') }

    it {
      should contain_file( 'beuser' ).with( {
        'ensure' => 'present',
        'path'   => '/bin/beuser',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '04755',
      } )
    }
  end

  describe 'Debian should include beuser binary' do

    let :facts do
      {
        :osfamily                => 'Debian',
        :operatingsystemrelease  => '12.04',
        :architecture            => 'x86_64',
      }
    end

    it { should include_class('beuser') }

    it {
      should contain_file( 'beuser' ).with( {
        'ensure' => 'present',
        'path'   => '/bin/beuser',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '04755',
      } )
    }
  end

  describe 'RHEL 6 should include beuser binary' do

    let :facts do
      {
        :osfamily          => 'RedHat',
        :operatingsystemrelease => '6.4',
      }
    end

    it { should include_class('beuser') }

    it {
      should contain_file( 'beuser' ).with( {
        'ensure' => 'present',
        'path'   => '/bin/beuser',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '04755',
      } )
    }
  end

  describe 'RHEL 5 should include beuser binary' do

    let :facts do
      {
        :osfamily          => 'RedHat',
        :operatingsystemrelease => '5.7',
      }
    end

    it { should include_class('beuser') }

    it {
      should contain_file( 'beuser' ).with( {
        'ensure' => 'present',
        'path'   => '/bin/beuser',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '04755',
      } )
    }
  end

  describe 'Gentoo systems should fail' do
    let(:facts) { {:osfamily => 'Gentoo' } }

    it do
      expect {
        should include_class('beuser')
      }.to raise_error(Puppet::Error,/OS is not supported by module beuser./)
    end
  end
end
