From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 16:02:39 +0200
Subject: [Buildroot] [git commit] libpng: bump to version 1.6.18
Message-ID: <20151002143558.5114A7FA23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=effd4f1ae72c82ee3af856d667b98bc0865ea48f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.hash |    6 +++---
 package/libpng/libpng.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index dd4af06..92ac24f 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.17/
-md5	430a9b76b78533235cd4b9b26ce75c7e	libpng-1.6.17.tar.xz
-sha1	6394f3c0847c3b9ea69f4f972dddae3786592050	libpng-1.6.17.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.18/
+md5	6a57c8e0f5469b9c9949a4b43d57b3a1	libpng-1.6.18.tar.xz
+sha1	c6e06510d30beba08c96c468ab269fafb2bb256f	libpng-1.6.18.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 08d8196..5500a61 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.17
+LIBPNG_VERSION = 1.6.18
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
