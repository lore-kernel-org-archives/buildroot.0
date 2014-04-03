From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:18:47 +0200
Subject: [Buildroot] [git commit] jquery-keyboard: bump to version 1.18.6
Message-ID: <20140403182128.3C12B9B1EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16465faa6bdb9d6c2c7509466b9fa5690ee4e16f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch to github download helper.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jquery-keyboard/jquery-keyboard.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

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
 
