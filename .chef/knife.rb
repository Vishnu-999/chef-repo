log_level                :info
log_location             STDOUT
node_name                'admin'
client_key               '/root/git/chef-repo/.chef/admin.pem'
validation_client_name   'devops-validator'
validation_key           '/root/git/chef-repo/.chef/devops-validator.pem'
chef_server_url          'https://192.168.56.118/organizations/devops'
syntax_check_cache_path  '/root/git/chef-repo/.chef/syntax_check_cache'
cookbook_path [ '/root/git/chef-repo/cookbooks' ]
