local if_nil = function(x, y)
  if x == nil then return y end
  return x
end

local native_lua = vim.api.nvim_get_runtime_file("deps/fzy-lua-native/lua/native.lua", false)[1]
if not native_lua then
  error("Unable to find native fzy native lua dep file. Probably need to update submodules!")
end

local native_lua_mod = loadfile(native_lua)()

return require('telescope').register_extension {
  setup = function(ext_config, config)
    local override_file = if_nil(ext_config.override_file_sorter, true)

    if override_file then
      config.file_sorter = function()
        return require('telescope.sorters').get_fzy_sorter({ fzy_mod = native_lua_mod })
      end
    end

    local override_generic = if_nil(ext_config.override_generic_sorter, true)
    if override_generic then
      config.generic_sorter = function()
        return require('telescope.sorters').get_fzy_sorter({ fzy_mod = native_lua_mod })
      end
    end
  end,

  -- requires = ...
  -- mappings = ...
  -- actions = ...
  -- commands = ...

  exports = {
    native_fzy_sorter = function()
      return require('telescope.sorters').get_fzy_sorter({ fzy_mod = native_lua_mod })
    end
  }
}
