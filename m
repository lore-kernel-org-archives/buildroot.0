From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 21:37:47 +0200
Subject: [Buildroot] [git commit] apr-util: bump to version 1.5.2
Message-ID: <20131014203036.52B069B9FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b388653d21fd46f5f5511570972e87c149da898
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...apr.patch => apr-util-01-remove-checkapr.patch} |    0
 package/apr-util/apr-util.mk                       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/apr-util/apr-util-1.4.1-remove-checkapr.patch b/package/apr-util/apr-util-01-remove-checkapr.patch
similarity index 100%
rename from package/apr-util/apr-util-1.4.1-remove-checkapr.patch
rename to package/apr-util/apr-util-01-remove-checkapr.patch
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 11551d6..51852e4 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.4.1
+APR_UTIL_VERSION = 1.5.2
 APR_UTIL_SITE = http://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
