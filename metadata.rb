name 'server_utils'
maintainer	 'Ed Overton'
maintainer_email 'you1@example.com'
chef_version     '>= 13.9'
license		 'Apache-2.0'
description	 'Installs/Configures server_utils'
version		 '1.2.0'

supports 'redhat'
supports 'centos'

issues_url 'https://github.com/emo3/server_utils/issues' if respond_to?(:issues_url)
source_url 'https://github.com/emo3/server_utils'

depends 'lvm'
depends 'hostsfile'
