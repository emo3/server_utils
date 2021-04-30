provides :set_hostname

property :host_ip,   String, default: '10.1.1.10'
property :host_name, String, default: 'chefsrv'

action :run do
  # set the IP and name of the Server in /etc/hosts file
  hostsfile_entry new_resource.host_ip do
    hostname new_resource.host_name
    action   :create
    unique   true
  end
end
