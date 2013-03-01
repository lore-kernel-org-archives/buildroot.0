From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 1 Mar 2013 16:15:50 +0100
Subject: [Buildroot] [git commit] file: bump to version 5.13
Message-ID: <20130301151834.549AC9AE2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afcc59259c4e299e6aaed89dc8bbc92a21397d38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/file/file.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index db68f66..7206705 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FILE_VERSION = 5.11
+FILE_VERSION = 5.13
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
