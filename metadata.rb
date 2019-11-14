name 'server_utils'
maintainer 'Ed Overton'
maintainer_email 'bogus@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures server_utils'
version '0.2.1'
chef_version '>= 13.0'

supports 'redhat'
supports 'centos'

issues_url 'https://github.com/emo3/server_utils/issues' if respond_to?(:issues_url)
source_url 'https://github.com/emo3/server_utils'

depends 'lvm'
depends 'hostsfile'
