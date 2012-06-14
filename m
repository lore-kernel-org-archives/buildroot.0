From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Jun 2012 08:05:47 -0300
Subject: [Buildroot] [PATCH] bind: security bump to version 9.6-ESV-R7-P1
Message-ID: <1339671947-14306-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump bind to version 9.6-ESV-R7-P1.
Fixes CVE-2012-667.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index eb7b9c0..88f79de 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BIND_VERSION = 9.6-ESV-R7
+BIND_VERSION = 9.6-ESV-R7-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
-- 
1.7.3.4
