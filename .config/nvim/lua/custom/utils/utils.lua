local M = {}

M.merge_tables = function(first_table, second_table)
  for k,v in pairs(second_table) do
    first_table[k] = v;
  end
end

M.merge_packages = function(tables)
  local container = {}
  for _, table in pairs(tables) do
    M.merge_tables(container, table)
  end

  return container
end

return M
