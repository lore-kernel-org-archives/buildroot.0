From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Nov 2014 10:36:50 -0300
Subject: [Buildroot] [PATCH 4/7] dhcpcd: bump to version 6.6.0
In-Reply-To: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1415281013-1077-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcpcd/dhcpcd.hash | 2 ++
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/dhcpcd/dhcpcd.hash

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
new file mode 100644
index 0000000..fd64ebe
--- /dev/null
+++ b/package/dhcpcd/dhcpcd.hash
@@ -0,0 +1,2 @@
+# Locally calculated from download (no sig, hash)
+sha256	16b94272cbb9ca22cb74c4421ee745f56850121613f6256587adb4e988c17fd0	dhcpcd-6.6.0.tar.bz2
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 60ac129..fe3c8d2 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.4.7
+DHCPCD_VERSION = 6.6.0
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.0.4
