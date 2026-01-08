local ts = require('nvim-treesitter')

local parsers = {'bash', 'lua', 'vim', 'json', 'python', 'regex', 'markdown'}

print("Installing treesitter parsers...")
for _, parser in ipairs(parsers) do
  print("Installing " .. parser)
  ts.install(parser)
end
print("Installation complete!")