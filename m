From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Aug 2014 12:08:43 -0300
Subject: [Buildroot] [PATCH] samba4: security update to 4.1.11
Message-ID: <1406905723-11546-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-3560 (Remote code execution in nmbd).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9e3178a..541efe0 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.10
+SAMBA4_VERSION = 4.1.11
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
-- 
1.8.5.5
