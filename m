From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 11:00:42 -0300
Subject: [Buildroot] [PATCH] dhcpcd: bump to version 6.7.1
Message-ID: <1426687242-19188-1-git-send-email-gustavo@zacarias.com.ar>
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
index ac927ae..b66244d 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	43f93a0a536b93e26e4c7733582df7595d73aff9acfef298323e59dd8db8cdab	dhcpcd-6.6.7.tar.bz2
+sha256	cb65d3e783fa5484ed095bb940c3274a5a91d3ed4a9d9ae66a49d9637165bd98	dhcpcd-6.7.1.tar.bz2
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 9c65826..5a3405a 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.6.7
+DHCPCD_VERSION = 6.7.1
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.0.5
