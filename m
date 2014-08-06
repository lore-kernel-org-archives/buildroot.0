From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Aug 2014 18:23:48 -0300
Subject: [Buildroot] [PATCH] nano: bump to version 2.3.6
Message-ID: <1407360228-17104-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nano/nano.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 16767df..038aaa5 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 2.3
-NANO_VERSION = $(NANO_VERSION_MAJOR).5
+NANO_VERSION = $(NANO_VERSION_MAJOR).6
 NANO_SITE = http://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
-- 
1.8.5.5
