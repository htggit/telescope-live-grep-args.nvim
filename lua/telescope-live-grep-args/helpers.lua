-- SPDX-FileCopyrightText: 2023 Michael Weimann <mail@michael-weimann.eu>
--
-- SPDX-License-Identifier: MIT

local M = {}

local quote_default_opts = {
  quote_char = '"',
}

M.quote = function(value, opts)
  local isQuoted = function(s)
    return s:match("^" .. opts.quote_char)
  end

  opts = opts or {}
  opts = vim.tbl_extend("force", quote_default_opts, opts)

  local quoted = isQuoted(value) and value or value:gsub(opts.quote_char, "\\" .. opts.quote_char)
  return isQuoted(quoted) and quoted or (opts.quote_char .. quoted .. opts.quote_char)
end

return M
