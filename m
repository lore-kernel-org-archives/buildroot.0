From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 14:54:12 +0100
Subject: [Buildroot] [git commit] jquery-keyboard: bump to version 1.18.2
Message-ID: <20140302135433.67297828EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e451698b44ec8a80bf565f51ce5719990476ca83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jquery-keyboard/jquery-keyboard.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
