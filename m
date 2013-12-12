From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2013 15:06:27 +0100
Subject: [Buildroot] [git commit] file: bump to version 5.16
Message-ID: <20131212142809.264EC9BFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=127e86b6ef3dc084f3632566722f2623a25e7d72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/file/file.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index 6436802..dc7c206 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.15
+FILE_VERSION = 5.16
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
