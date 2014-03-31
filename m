From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 31 Mar 2014 16:08:13 -0300
Subject: [Buildroot] [PATCH] jquery-keyboard: bump to version 1.18.6
Message-ID: <1396292893-7001-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also switch to github download helper.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-keyboard/jquery-keyboard.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
index f67e7bd..f2e51bc 100644
--- a/package/jquery-keyboard/jquery-keyboard.mk
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-JQUERY_KEYBOARD_VERSION = v1.18.2
-JQUERY_KEYBOARD_SITE = \
-	http://github.com/Mottie/Keyboard/tarball/$(JQUERY_KEYBOARD_VERSION)
+JQUERY_KEYBOARD_VERSION = v1.18.6
+JQUERY_KEYBOARD_SITE = $(call github,Mottie,Keyboard,$(JQUERY_KEYBOARD_VERSION))
 JQUERY_KEYBOARD_LICENSE = MIT WTFPL
 JQUERY_KEYBOARD_LICENSE_FILES = README.markdown
 
-- 
1.8.3.2
