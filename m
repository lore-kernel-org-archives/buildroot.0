From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:16 -0300
Subject: [Buildroot] [PATCH 19/19] openvpn: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-19-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openvpn/openvpn.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 0756ec4..92f6f18 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -7,6 +7,8 @@
 OPENVPN_VERSION = 2.3.2
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
+OPENVPN_LICENSE = GPLv2
+OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 OPENVPN_CONF_OPT = --disable-plugin-auth-pam --enable-iproute2
 OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
 	NETSTAT=/bin/netstat \
-- 
1.8.1.5
