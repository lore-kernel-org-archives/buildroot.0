From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 May 2012 22:25:59 +0200
Subject: [Buildroot] [git commit] libidn: bump to version 1.25
Message-ID: <20120531113300.825BD96E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fcdb1d212b8e143b713a4e677631c66f2dbf026
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libidn/libidn.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 935240b..6d2bea6 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBIDN_VERSION = 1.24
+LIBIDN_VERSION = 1.25
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
