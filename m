From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Sep 2012 22:39:49 +0200
Subject: [Buildroot] [git commit] less: bump to version 451
Message-ID: <20120909210323.2E573995ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ef851e86be727da06a55ab0b66dcef0c9fdf16e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is GPLv3+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/less/less.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index c0ecf20..72449c3 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-LESS_VERSION = 444
+LESS_VERSION = 451
 LESS_SITE = http://www.greenwoodsoftware.com/less
+LESS_LICENSE = GPLv3+
+LESS_LICENSE_FILES = COPYING
 # Build after busybox, full-blown is better
 LESS_DEPENDENCIES = ncurses $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
