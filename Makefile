#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# http://blog.kuoruan.com/ kuoruan <kuoruan@gmail.com>
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-shadowsocksR
PKG_VERSION:=2.4.5
PKG_RELEASE:=6pre

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-shadowsocksR
  SECTION:=LuCI
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=Luci Support for ShadowsocksR.
  DEPENDS:=+luci +libopenssl +libpthread +shadowsocksR-libev
  PKGARCH:=all
endef

define Package/luci-app-shadowsocksR/description
	Luci Support for shadowsocksR,only chinese.
endef

define Package/luci-app-shadowsocksR/postinst
#!/bin/sh
for i in libm libdl libpthread libc
do
	if [ ! -e /lib/$i.so.1 ] ; then
	if [ -e /lib/$i.so.0 ] ; then
	ln -s /lib/$i.so.0 /lib/$i.so.1
	fi
	fi
done
if [ -e /etc/openwrt_release ]; then
	/etc/init.d/ssr-redir.sh enable || :
fi
endef

define Build/Compile
endef

define Package/luci-app-shadowsocksR/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,luci-app-shadowsocksR))

