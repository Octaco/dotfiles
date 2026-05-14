local plugins = require("plugins")

local function get_plugin_name(plugin)
	if plugin.name then
		return plugin.name
	end

	return plugin.src:match(".*/([^/]+)$")
end

local pack_specs = {}

for _, plugin in ipairs(plugins) do
	local spec = { src = plugin.src }

	if plugin.branch then
		spec.branch = plugin.branch
	end
	if plugin.build then
		spec.build = plugin.build
	end
	if plugin.version then
		spec.version = plugin.version
	end

	table.insert(pack_specs, spec)
end

vim.pack.add(pack_specs)

for _, plugin in ipairs(plugins) do
	-- local plugin_name = get_plugin_name(plugin)
	-- vim.cmd.packadd(plugin_name)

	if plugin.config then
		require(plugin.config)
	end
end
