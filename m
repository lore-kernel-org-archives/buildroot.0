From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Jun 2014 17:11:14 -0300
Subject: [Buildroot] [PATCH 2/2] jquery-keyboard: bump to version 1.18.9
In-Reply-To: <1401739874-18576-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401739874-18576-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1401739874-18576-2-git-send-email-gustavo@zacarias.com.ar>
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
index f2e51bc..317dc14 100644
--- a/package/jquery-keyboard/jquery-keyboard.mk
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_KEYBOARD_VERSION = v1.18.6
+JQUERY_KEYBOARD_VERSION = v1.18.9
 JQUERY_KEYBOARD_SITE = $(call github,Mottie,Keyboard,$(JQUERY_KEYBOARD_VERSION))
 JQUERY_KEYBOARD_LICENSE = MIT WTFPL
 JQUERY_KEYBOARD_LICENSE_FILES = README.markdown
-- 
1.8.5.5
