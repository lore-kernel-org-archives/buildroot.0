From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Jan 2012 11:09:11 +0100
Subject: [Buildroot] [git commit] file: bump to version 5.10
Message-ID: <20120106101009.7712C8FFE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c2e5b09aaa1fda2656f4803476f7014ccd51040
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/file/file.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index 7536056..bb1b6bd 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-FILE_VERSION = 5.09
-FILE_SITE = ftp://ftp.astron.com/pub/file/
+FILE_VERSION = 5.10
+FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
 FILE_INSTALL_STAGING = YES
