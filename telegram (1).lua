module("luci.controller.telegram", package.seeall)

function index()
    entry({"admin", "services", "telegram"}, cbi("telegram_config"), _("Telegram Settings"), 10)
    entry({"admin", "services", "telegram", "update"}, call("update_config"), nil).leaf = true
end

function update_config()
    local fs = require "nixio.fs"
    local uci = require "luci.model.uci".cursor()
    
    local group_id = luci.http.formvalue("group_id")
    local message_thread_id = luci.http.formvalue("message_thread_id")
    local bot_token = luci.http.formvalue("bot_token")
    
    if group_id and message_thread_id and bot_token then
        uci:set("telegram", "settings", "group_id", group_id)
        uci:set("telegram", "settings", "message_thread_id", message_thread_id)
        uci:set("telegram", "settings", "bot_token", bot_token)
        uci:commit("telegram")
        
        luci.http.prepare_content("application/json")
        luci.http.write_json({ success = true, message = "Configuration updated successfully" })
    else
        luci.http.status(400, "Bad Request")
        luci.http.prepare_content("application/json")
        luci.http.write_json({ success = false, message = "Missing parameters" })
    end
end
