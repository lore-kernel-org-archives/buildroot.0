From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:56:35 +0100
Subject: [Buildroot] [git commit] package/libfribidi: bump version to 0.19.7
Message-ID: <20151201232120.4ABB3802AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9334e73358bc2e991b37a8c533095ed127ec5065
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfribidi/libfribidi.hash | 4 ++--
 package/libfribidi/libfribidi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index 003944a..79b5dd3 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,2 +1,2 @@
-# From http://www.fribidi.org/download/fribidi-0.19.6.tar.bz2.sha256
-sha256	cba8b7423c817e5adf50d28ec9079d14eafcec9127b9e8c8f1960c5ad585e17d	fribidi-0.19.6.tar.bz2
+# From http://www.fribidi.org/download/fribidi-0.19.7.tar.bz2.sha256
+sha256	08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66571ad2a670595a8e	fribidi-0.19.7.tar.bz2
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 1cf3b7c..4e82a5e 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 0.19.6
+LIBFRIBIDI_VERSION = 0.19.7
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
 LIBFRIBIDI_SITE = http://www.fribidi.org/download
 LIBFRIBIDI_LICENSE = LGPLv2.1+
