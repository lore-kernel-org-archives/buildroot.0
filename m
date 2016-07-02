From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  2 Jul 2016 08:46:20 -0300
Subject: [Buildroot] [PATCH] liboping: bump to version 1.9.0
Message-ID: <1467459980-12422-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liboping/liboping.hash | 2 +-
 package/liboping/liboping.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/liboping/liboping.hash b/package/liboping/liboping.hash
index 536f6ae..3e796cc 100644
--- a/package/liboping/liboping.hash
+++ b/package/liboping/liboping.hash
@@ -1,2 +1,2 @@
 # From http://noping.cc/#download
-sha256	824792ae7fc5e9569bacc4167b89de31f6ba8476de44760f0bc272682e894b41	liboping-1.8.0.tar.gz
+sha256	44bb1d88b56b88fda5533edb3aa005c69b3cd396f20453a157d7e31e536f3530	liboping-1.9.0.tar.bz2
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index 94de73c..6e071a5 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBOPING_VERSION = 1.8.0
+LIBOPING_VERSION = 1.9.0
 LIBOPING_SITE = http://noping.cc/files
+LIBOPING_SOURCE = liboping-$(LIBOPING_VERSION).tar.bz2
 LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPTS = --without-perl-bindings
-- 
2.7.3
