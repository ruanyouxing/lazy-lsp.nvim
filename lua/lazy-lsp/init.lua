local lspconfig = require 'lspconfig'
local servers = require 'lazy-lsp.servers'
local overrides = require 'lazy-lsp.overrides'
local helpers = require 'lazy-lsp.helpers'

local function setup(opts)
  if opts.cmd_overrides then
    for lsp_name,cmd in pairs(opts.cmd_overrides) do
      overrides[lsp_name].cmd = cmd
    end
  end
  for server, server_opts in pairs(helpers.server_configs(lspconfig, servers, opts, overrides)) do
    lspconfig[server].setup(server_opts)
  end
end

return {
  setup = setup,
  in_shell = helpers.in_shell,
}
