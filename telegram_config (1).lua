local m, s, o

m = Map("telegram", translate("Telegram Settings"), translate("Configure Telegram bot settings for your OpenWRT router."))

s = m:section(NamedSection, "settings", "telegram", translate("Telegram Configuration"))

o = s:option(Value, "group_id", translate("Group ID"))
o.datatype = "string"
o.placeholder = "Enter your Telegram Group ID"

o = s:option(Value, "message_thread_id", translate("Message Thread ID"))
o.datatype = "string"
o.placeholder = "Enter your Telegram Message Thread ID"

o = s:option(Value, "bot_token", translate("Bot Token"))
o.datatype = "string"
o.password = true
o.placeholder = "Enter your Telegram Bot Token"
o.rmempty = false
o.size = 100  -- Set field size (length of input box)

return m
