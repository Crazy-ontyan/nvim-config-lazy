local submode = require("submode")
local resize = require("winresize").resize

submode.create("WinResize", {
    mode = "n",
    leave = { "q", "<ESC>" },
}, function(register)
    register("h", function() resize(0, 2, "left") end)
    register("j", function() resize(0, 1, "down") end)
    register("k", function() resize(0, 1, "up") end)
    register("l", function() resize(0, 2, "right") end)
end)

vim.keymap.set("n", "<Leader>r", function()
    if vim.fn.winnr("$") < 2 then
        vim.notify("Resize mode: split window first (:vsplit / :split)", vim.log.levels.INFO)
        return
    end

    submode.enter("WinResize")
    vim.notify("Resize mode: h/j/k/l, leave with q or Esc", vim.log.levels.INFO)
end, { desc = "Enter window resize mode" })
