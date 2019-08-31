resource_name :epel_local_repo

property :epel_ver, String, default: '7'
property :web_srv,  String, default: 'http://10.1.1.30'

action :install do
  # Delete any existing epel* files
  Dir["/etc/you.repos.d/epel*"].each do |path|
    file ::File.expand_path(path) do
      action :delete
    end
  end

  # create local epel repo
  template "/etc/yum.repos.d/epel#{new_resource.epel_ver}" do
    source 'epel.erb'
    cookbook 'nc_tools'
    variables(
      epel_ver: new_resource.epel_ver,
      web_srv:  new_resource.web_srv
    )
    mode 0755
    action :create
  end
end
