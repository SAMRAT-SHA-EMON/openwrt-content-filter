include $(TOPDIR)/rules.mk

PKG_NAME:=openwrt-content-filter
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/openwrt-content-filter
  SECTION:=net
  CATEGORY:=Network
  TITLE:=All-in-One Content Filter
  DEPENDS:=+dnsmasq-full +ipset +nftables +luci +luci-compat
  PKGARCH:=all
endef

define Package/openwrt-content-filter/description
  Combined DNS/IP/App filter with web interface.
endef

define Build/Prepare
    mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/openwrt-content-filter/install
    # Install config files
    $(INSTALL_DIR) $(1)/etc/config
    $(INSTALL_CONF) ./files/etc/config/blocker $(1)/etc/config/blocker
    
    # Install init script
    $(INSTALL_DIR) $(1)/etc/init.d
    $(INSTALL_BIN) ./files/etc/init.d/blocker $(1)/etc/init.d/blocker
    
    # Install blocklists
    $(INSTALL_DIR) $(1)/usr/share/blocker/blocklists
    $(INSTALL_DATA) ./files/usr/share/blocker/blocklists/* $(1)/usr/share/blocker/blocklists/
    
    # Install LuCI web UI
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
    $(INSTALL_DATA) ./files/usr/lib/lua/luci/controller/blocker.lua $(1)/usr/lib/lua/luci/controller/
endef

$(eval $(call BuildPackage,openwrt-content-filter))
