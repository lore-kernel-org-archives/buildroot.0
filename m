From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:20 -0000
Subject: [Buildroot] [git commit branch/next] gzip: bump to version 1.5
Message-ID: <20120802195242.0C81E8C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3cae83573ab9030da718b68de2d9d61a0728143
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
