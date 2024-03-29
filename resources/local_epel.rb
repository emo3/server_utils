provides :epel_local_repo
unified_mode true

property :web_srv, String, default: 'http://10.1.1.30'

action :install do
  epel_ver = if node['platform_version'] < '8'
               '7'
             else
               '8'
             end
  # create local epel repo
  template "/etc/yum.repos.d/epel#{epel_ver}.repo" do
    source 'epel.erb'
    cookbook 'server_utils'
    variables(
      epel_ver: epel_ver,
      web_srv:  new_resource.web_srv
    )
    mode '0644'
    action :create
  end

  # create local epel GPG file
  template "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-#{epel_ver}" do
    source "RPM-GPG-KEY-EPEL-#{epel_ver}.erb"
    cookbook 'server_utils'
    mode '0644'
    action :create
  end
end # action :install do
