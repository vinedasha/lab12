-- receive samples from collectd
function my_influx_write(x)
-- filter samples
if x.host ~= 'debian' or
x.plugin ~= 'memory' or
x.type ~= 'memory' or
x.type instance ~= 'used'
then return 0 end
collectd.log_info(x.host …
x.plugin .
x.type …
x.type_instance …
x.values[1])
local host = '127.0.0.1'
local token = ItDWEUnuEmDsdVAjqB2II7jbwtpS7poJRqPHlv0FYvHoRSGvN0WkwYimyrgtUHB0xyF0m_l-dCURqQM5k0rGg=='
local organization = 'org'
local bucket = 'buck'
local timestamp = os. time()
- prepare curl parameters
local cmd = 'curl --request POST';
cmd = cmd "http:// . host … :086/api/v2/write?org=' organization … '&bucket=' bucket …
&precision=s"
cmd = cmd …
header "Authorization: Token token
cmd = cmd …
-data-raw "test' host='
x.host .type=' x.type …
x.values[1] …
timestamp
x.type_instance …
- run curl sending samples to influxdb
os. execute(cmd)
return 0
end
- tell collectd about our write function
collectd.register write(my influx write)
