From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:49:51 +0200
Subject: [Buildroot] [git commit] package/dhcp: remove autoreconf
Message-ID: <20150720205435.5BC2B81E4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f757bbbfdf168b9e1104c246513b89a9ba21da0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0001-fix-configure-debug.patch was removed in
commit 68e846d3b2875b5e7a79bfb33629bf2793840939

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/dhcp.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index c0d4588..effcbe2 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -9,8 +9,6 @@ DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = ISC
 DHCP_LICENSE_FILES = LICENSE
-# For 0001-fix-configure-debug.patch
-DHCP_AUTORECONF = YES
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
