From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  2 Mar 2014 09:58:37 -0300
Subject: [Buildroot] [PATCH 4/5] jquery-keyboard: bump to version 1.18.2
In-Reply-To: <1393765118-9353-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393765118-9353-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1393765118-9353-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-keyboard/jquery-keyboard.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
index 41edebf..f67e7bd 100644
--- a/package/jquery-keyboard/jquery-keyboard.mk
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_KEYBOARD_VERSION = v1.17.7
+JQUERY_KEYBOARD_VERSION = v1.18.2
 JQUERY_KEYBOARD_SITE = \
 	http://github.com/Mottie/Keyboard/tarball/$(JQUERY_KEYBOARD_VERSION)
 JQUERY_KEYBOARD_LICENSE = MIT WTFPL
-- 
1.8.3.2
