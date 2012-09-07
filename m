From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Sep 2012 11:48:49 -0300
Subject: [Buildroot] [PATCH 02/10] less: bump to version 451
In-Reply-To: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347029337-12494-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1347029337-12494-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/less/less.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index c0ecf20..8f14016 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-LESS_VERSION = 444
+LESS_VERSION = 451
 LESS_SITE = http://www.greenwoodsoftware.com/less
+LESS_LICENSE = GPLv3
+LESS_LICENSE_FILES = COPYING
 # Build after busybox, full-blown is better
 LESS_DEPENDENCIES = ncurses $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
-- 
1.7.8.6
