resource_name :set_hostname
provides :set_hostname

property :host_ip,   String, default: ''
property :host_name, String, default: ''

action :run do
  # set the IP and name of the Server in /etc/hosts file
  hostsfile_entry new_resource.host_ip do
    hostname new_resource.host_name
    action   :create
    unique   true
  end
end
