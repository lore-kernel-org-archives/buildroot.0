From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 19:49:00 +0200
Subject: [Buildroot] [git commit] automake: bump to version 1.11.5
Message-ID: <20120624180619.5E417836A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8133b7d5d69f60e29bf2f421113f0e99cbafd332
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/automake/automake.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 7f35f3f..522e22c 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -3,8 +3,8 @@
 # automake
 #
 #############################################################
-AUTOMAKE_VERSION = 1.11.1
-AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.bz2
+
+AUTOMAKE_VERSION = 1.11.5
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 
 AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl
