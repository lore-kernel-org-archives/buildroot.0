From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Oct 2012 19:02:29 -0300
Subject: [Buildroot] [PATCH] bind: security bump to version 9.6-ESV-R8
Message-ID: <1349992949-24002-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2012-5166, CVE-2012-4244, CVE-2012-3817 and CVE-2012-1667.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 736001c..bd7e5ed 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BIND_VERSION = 9.6-ESV-R7-P2
+BIND_VERSION = 9.6-ESV-R8
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
-- 
1.7.8.6
