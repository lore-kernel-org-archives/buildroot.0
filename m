From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Apr 2012 09:11:40 -0300
Subject: [Buildroot] [PATCH] bind: security bump to 9.6-ESV-R6
Message-ID: <1333627900-27709-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct fix for CVE-2011-4313
9.6-ESV-R5-P1 used a restart workaround.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0de986d..987bd4e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BIND_VERSION = 9.6-ESV-R5-P1
+BIND_VERSION = 9.6-ESV-R6
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
-- 
1.7.3.4
