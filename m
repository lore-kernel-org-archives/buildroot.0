From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2014 15:30:13 +0100
Subject: [Buildroot] [git commit] file: bump to version 5.17
Message-ID: <20140228143133.CC4399B2D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4252841355f2bc81edde6ff0fbf7b440a3e1fd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/file/file.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index dc7c206..ac9cf55 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.16
+FILE_VERSION = 5.17
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
