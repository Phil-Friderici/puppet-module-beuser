require 'spec_helper'

describe 'beuser' do

  context 'with defaults on a supported operatingsystem' do
    it {
      should contain_file( 'beuser' ).with( {
        'ensure' => 'present',
        'path'   => '/bin/beuser',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '04755',
      } )
    }
  }
}

