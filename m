From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Jun 2012 14:16:05 +0200
Subject: [Buildroot] [git commit] gzip: bump to version 1.5
Message-ID: <20120623122030.A3E698A30D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3cae83573ab9030da718b68de2d9d61a0728143
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gzip/gzip.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index f712f98..5fad001 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -3,8 +3,8 @@
 # gzip
 #
 #############################################################
-GZIP_VERSION:=1.4
-GZIP_SOURCE:=gzip-$(GZIP_VERSION).tar.gz
-GZIP_SITE:=$(BR2_GNU_MIRROR)/gzip
+
+GZIP_VERSION = 1.5
+GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 
 $(eval $(call AUTOTARGETS))
