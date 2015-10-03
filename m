From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  3 Oct 2015 07:28:17 -0300
Subject: [Buildroot] [PATCH 1/2] dhcpcd: bump to version 6.9.3
Message-ID: <1443868098-15805-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcpcd/dhcpcd.hash | 2 +-
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 98351a2..71d0e28 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	c03b750e1fe2890b62ac0e7d7092a1698b598adb6f88b67916586a619f7c066f	dhcpcd-6.9.1.tar.xz
+sha256	6089471ed695fa62ac8351466b96b4b6365fd14ec455a120a6524663808eae53	dhcpcd-6.9.3.tar.xz
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 67ae69f..de169b5 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.9.1
+DHCPCD_VERSION = 6.9.3
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.4.9
