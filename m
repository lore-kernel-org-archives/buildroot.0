From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 02:46:30 -0300
Subject: [Buildroot] [PATCH] opentyrian: switch to bitbucket
Message-ID: <1429767990-6382-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we know google code is going away, so switch the site/source now
rather than waiting for breakage.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/opentyrian/Config.in     | 2 +-
 package/opentyrian/opentyrian.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opentyrian/Config.in b/package/opentyrian/Config.in
index 3ebcf08..b0c519f 100644
--- a/package/opentyrian/Config.in
+++ b/package/opentyrian/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_OPENTYRIAN
 	  to play the game.
 	  If you want some sound, activate ALSA with OSS emulation.
 
-	  http://code.google.com/p/opentyrian/
+	  https://bitbucket.org/opentyrian/opentyrian/wiki/Home
 
 if BR2_PACKAGE_OPENTYRIAN
 
diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index 3dc5af5..b74e4cf 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENTYRIAN_VERSION = 9c9f0ec3532b
-OPENTYRIAN_SITE = https://code.google.com/p/opentyrian/
+OPENTYRIAN_SITE = https://bitbucket.org/opentyrian/opentyrian
 OPENTYRIAN_SITE_METHOD = hg
 OPENTYRIAN_LICENSE = GPLv2+
 OPENTYRIAN_LICENSE_FILES = COPYING
-- 
2.0.5
