#
# Cookbook Name:: samba
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
include_recipe 'samba::client'

chef_secret = Chef::EncryptedDataBagItem.load_secret("/etc/chef/encrypted_data_bag_secret")

samba_creds = Chef::EncryptedDataBagItem.load("passwords","samba",chef_secret)
smb_user = samba_creds['smb_user']
smb_password = samba_creds['smb_password']


template "/etc/.smbcredentials" do
  source ".smbcredentials.erb"
  mode  "0644"
  variables (
    {
      :smb_user => smb_user,
      :smb_password => smb_password
    })

end

