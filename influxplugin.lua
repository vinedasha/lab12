-- receive samples from collectd
function vinog(x)

-- filter samples
if x.host ~= 'vinogradova' or
x.plugin ~= 'memory' or
x.type ~= 'memory' or
x.type_instance ~= 'used' then return 0 end
collectd.log_info(x.host .. ' ' .. x.plugin .. ' ' .. x.type .. ' ' .. x.type_instance .. ' ' .. x.values[1])
local host = '127.0.0.1'
local token = 'KEVBfK59PNVNAq-eIqd1Renxz41m4_dMMpwgmIU4aUxsq8P2ZFPzwWLqFP2lYyPIXmYAglCn5yqcjgatV3xIpA=='
local organization = 'org'
local bucket = 'bucket'
local timestamp = os.time()
-- prepare curl parameters
local cmd = 'curl --request POST';
cmd = cmd .. ' "http://' .. host .. ':8086/api/v2/write?org=' .. organization .. '&bucket=' .. bucket .. '&precision=s"'
cmd = cmd .. ' --header "Authorization: Token ' .. token .. '"'
cmd = cmd .. ' --data-raw "test' .. ',host=' .. x.host .. ',type=' .. x.type .. ' ' .. x.type_instance .. '=' ..  x.values[1] .. ' ' .. timestamp .. '"'


-- run curl sending samples to influxdb
os.execute(cmd)
return 0
end
-- tell collectd about our write function
collectd.register_write(vinog)




