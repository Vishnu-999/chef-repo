#
# Cookbook Name:: autofs
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
include_recipe 'samba'

package node['autofs']['package_name']


service node['autofs']['service_name'] do
      supports :status => true, :restart => true, :reload => true
      action [:enable, :start]
end

bash "configure master map file" do
    code <<-EOF
    echo -e "/mnt #{node['autofs']['conf_dir']}/auto.cifs-shares --timeout=20" >> #{node['autofs']['conf_dir']}/auto.master
    EOF
        notifies :restart, 'service[autofs]', :immediately
    not_if 'grep auto.cifs-shares auto.master', :cwd => node['autofs']['conf_dir']
    end

bash "Add Mount Point in auto.misc file" do
    code <<-EOF
    echo -e "sharedrepo -fstype=cifs,rw,credentials=#{node['autofs']['conf_dir']}/.smbcredentials,file_mode=0777,dir_mode=0777 ://192.168.56.111/sharedrepo" > #{node['autofs']['conf_dir']}/auto.cifs-shares
    EOF
        notifies :restart, 'service[autofs]', :immediately
    not_if 'grep sharedrepo auto.cifs-shares', :cwd => node['autofs']['conf_dir']
end

