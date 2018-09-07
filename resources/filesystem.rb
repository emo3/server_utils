resource_name :create_xfs
provides :create_xfs

property :device,    String, default: '/dev/sdb'
property :lvg_name,  String, default: 'apmvg'
property :lv_name,   String, default: 'lvagent'
property :lv_size,   String, default: '10G'
property :fs_type,   String, default: 'xfs'
property :mnt_point, String, default: '/agents'

action :run do
  log "device   = #{new_resource.device}"
  log "lvg_name = #{new_resource.lvg_name}"
  #######################################
  # Set physical volume
  lvm_physical_volume new_resource.device

  #######################################
  # Set volume group
  lvm_volume_group new_resource.lvg_name do
    physical_volumes [new_resource.device]
  end

  #######################################
  # Set logical volume
  lvm_logical_volume new_resource.lv_name do
    group new_resource.lvg_name
    size new_resource.lv_size
    filesystem new_resource.fs_type
    mount_point new_resource.mnt_point
  end
end