-- send samples to collectd
function my_read()
--prepare sample to be dispatched
local x =
{
host = 'vinhost',
plugin = 'vinplugin',
type = 'gauge',
values = {10*math.sin(os.time()/100.0)}
}
collectd.dispatch_values(x) -- send samples to collectd
return 0
end
--receive samples from collectd
function my_write(x)
collectd.log_info(x.host .. '  ' .. x.plugin .. ' ' .. x.type .. ' ' .. x.type_instance)
for i = 1, #x.values do -- for each sample
collectd.log_info(x.values[i])
end
return 0
end
-- tell collectd about our read and write functions
collectd.register_read(my_read)
collectd.register_write(my_write)
