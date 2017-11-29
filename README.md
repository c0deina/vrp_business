# vrp_business
vRP Business is an approach to the business creation for vRP using its own tools.
It has it's own paycheck yet it's still in alpha so I'd double check before using on a public environment.

Currently it only allows you to buy a business which will generate you revenue over the time just like another job.

REQUIREMENTS

In order for this to work you'll need to create a new group called "HBO" in your /vrp/cfg/groups.lua file like this:

If you want to have this as the only job the user can have use add this to groups.lua

    ["HBO"] = {
        _config = { gtype = "job" },
    "some.permission"
    }
  
  If you want the users to be able to have another job (recommended) add this to groups.lua
  
    ["HBO"] = {
    "some.permission"
    }
