From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jul 2016 21:10:39 -0300
Subject: [Buildroot] [PATCH] bmon: bump to version 3.9
Message-ID: <1469232639-397-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And switch to github homepage.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bmon/Config.in | 2 +-
 package/bmon/bmon.hash | 2 +-
 package/bmon/bmon.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bmon/Config.in b/package/bmon/Config.in
index 09ae9cb..bb79693 100644
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_BMON
 	  various input modules. It provides various output methods
 	  including a curses based interface.
 
-	  http://www.infradead.org/~tgr/bmon/
+	  https://github.com/tgraf/bmon/
 
 comment "bmon needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bmon/bmon.hash b/package/bmon/bmon.hash
index 810a0b9..7f28b74 100644
--- a/package/bmon/bmon.hash
+++ b/package/bmon/bmon.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a9f3d7010074a3190038a8d95df5d47aaf2046b47d872590336b5f93be084685  bmon-3.7.tar.gz
+sha256  9c08332520497ef1d51a733ca531ffedbb5a30c7c3f55579efe86c36138f93e1  bmon-3.9.tar.gz
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 0939609..91993b6 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BMON_VERSION = 3.7
+BMON_VERSION = 3.9
 BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
 BMON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.7.3
