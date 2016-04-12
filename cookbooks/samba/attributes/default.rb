case node['platform']
when 'ubuntu'
default['samba']['packages'] = %w(samba samba-common cifs-utils)
when 'redhat', 'centos'
default['samba']['packages'] = %w(samba-client samba-common cifs-utils)
end

