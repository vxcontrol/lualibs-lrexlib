-- See Copyright Notice in the file LICENSE

local luatest = require "rex_lua_test"
local glue = require "glue"

-- returns: number of failures
local function test_library (libname, setfile, verbose, use_alien)
  if verbose then
    print (("[lib: %s; file: %s]"):format (libname, setfile))
  end
  local lib = require (libname)
  local f = require (setfile)
  local sets = f (libname)

  local newmembuffer = lib._newmembuffer
  if not newmembuffer then
    io.stderr:write ("Warning: cannot run tests with buffer subjects\n")
  end

  local n = 0 -- number of failures
  for _, set in ipairs (sets) do
    if verbose then
      print (set.Name or "Unnamed set")
    end
    local err = luatest.test_set (set, lib, newmembuffer)
    if verbose then
      if glue.count(err) == 0 then
        print ("  Test successful")
      end
      for _,v in ipairs (err) do
        print ("  Test " .. v.i)
        luatest.print_results (v, "  ")
      end
    end
    n = n + #err
  end
  if verbose then
    print ""
  end
  return n
end

local avail_tests = {
  pcre2 = { lib = "rex_pcre2", "rex_common_sets_test", "rex_pcre_sets_test", "rex_pcre_sets2_test", },
}

do
  local verbose, nerr, ntest = true, 0, 0
  -- do tests
  for _, test in pairs (avail_tests) do
    package.loaded[test.lib] = nil -- to force-reload the tested library
    for _, setfile in ipairs (test) do
      nerr = nerr + test_library (test.lib, setfile, verbose)
      ntest = ntest + 1
    end
  end
  print ("Total number of failures: " .. nerr .. " of " .. ntest)
end
