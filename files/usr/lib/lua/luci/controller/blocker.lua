module("luci.controller.blocker", package.seeall)

function index()
    entry({"admin", "services", "blocker"}, cbi("blocker"), _("Content Filter"), 30)
end
