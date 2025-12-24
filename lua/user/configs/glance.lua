return {
	hooks = {
		before_open = function(results, open, jump, method)
			if #results == 0 then
				vim.notify(
					"This method is not supported by any of the servers registered for the current buffer",
					vim.log.levels.WARN,
					{ title = "Glance" }
				)
			elseif #results == 1 and method == "references" then
				vim.notify(
					"The identifier under cursor is the only one found",
					vim.log.levels.INFO,
					{ title = "Glance" }
				)
			elseif #results == 1 and method == "definitions" then
				-- Jump to the only definition
				jump(results[1])
			else
				open(results)
			end
		end,
	},
}
