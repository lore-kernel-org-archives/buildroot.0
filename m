From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 22:29:22 +0200
Subject: [Buildroot] [git commit] jquery-keyboard: bump to version 1.18.9
Message-ID: <20140602211714.B18799CDCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4549ff255d419db9500c0763f1fa61debbaadc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jquery-keyboard/jquery-keyboard.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
