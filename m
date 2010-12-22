From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] tar: bump to version 1.25
Message-ID: <20101222232249.016DF8E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4860730019db598b8e4b6f2f03cef0677ab36fef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tar/tar.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index f9ee74b..e1e16a2 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -3,8 +3,8 @@
 # tar
 #
 #############################################################
-TAR_VERSION:=1.21
-TAR_SOURCE:=tar-$(TAR_VERSION).tar.bz2
-TAR_SITE:=$(BR2_GNU_MIRROR)/tar/
+
+TAR_VERSION = 1.25
+TAR_SITE = $(BR2_GNU_MIRROR)/tar
 
 $(eval $(call AUTOTARGETS,package,tar))
-- 
1.7.2.2
