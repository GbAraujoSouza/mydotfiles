return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python"
  },
  config = function()
    local dap = require "dap"
    local ui = require "dapui"

    require("dapui").setup()
    require("dap-go").setup()

    --python
    local path = " ~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    require("dap-python").setup(path)

    -- dap.adapters.go = function(callback, config)
    --   vim.defer_fn(function()
    --       callback({ type = "server", host = "127.0.0.1", port = "${port}" })
    --     end,
    --     100)
    -- end

    -- dap.configurations.go = {
    --   {
    --     type = "go",
    --     name = "Debug",
    --     request = "launch",
    --     program = "${file}",
    --     port = "${port}"
    --   }
    -- }

    require('dap.ext.vscode').load_launchjs(nil, {})

    vim.keymap.set("n", "<leader>bk", dap.toggle_breakpoint)

    -- Eval variable under cursor
    vim.keymap.set("n", "<leader>?", function()
      require("dapui").eval(nil, { enter = true })
    end)

    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F2>", dap.step_into)
    vim.keymap.set("n", "<F3>", dap.step_over)
    vim.keymap.set("n", "<F4>", dap.step_out)
    vim.keymap.set("n", "<F5>", dap.step_back)
    vim.keymap.set("n", "<F12>", dap.restart)

    -- Tell dap ui when to open the ui
    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end

    vim.fn.sign_define('DapBreakpoint',{ text ='🔴', texthl ='', linehl ='', numhl =''})
  end
}
