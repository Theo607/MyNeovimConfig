-- lua/plugins/twilight.lua
return {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" }, -- lazy-load on command
    config = function()
        require("twilight").setup({
            dimming = {
                alpha = 0.25, -- how much to dim the inactive portions
                color = { "Normal", "#ffffff" },
                inactive = true, -- dim inactive windows too
            },
            context = 10, -- number of lines to keep fully visible around the cursor
            exclude = {}, -- filetypes to exclude
        })
    end,
}

