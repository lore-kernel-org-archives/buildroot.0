From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 Jun 2014 08:36:51 -0300
Subject: [Buildroot] [PATCH 1/2] samba4: security bump to version 4.1.9
Message-ID: <1403523412-15688-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-0244 (Denial of service - CPU loop)
CVE-2014-3493 (Denial of service - Server crash/memory corruption)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index a15ddb4..e2336e7 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.8
+SAMBA4_VERSION = 4.1.9
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
-- 
1.8.5.5
