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

-- Insert values into a list if they don't already exist
---@param tbl string[]
---@param vals string|string[]
function M.list_insert_unique(tbl, vals)
  if type(vals) ~= "table" then
    vals = { vals }
  end
  for _, val in ipairs(vals) do
    if not vim.tbl_contains(tbl, val) then
      table.insert(tbl, val)
    end
  end
end

return M
