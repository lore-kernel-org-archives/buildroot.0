From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Aug 2019 19:40:04 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/joe: bump version to 4.6
Message-ID: <20190827174004.24134-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Release notes:
https://sourceforge.net/p/joe-editor/mercurial/ci/default/tree/NEWS.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/joe/joe.hash | 9 +++++----
 package/joe/joe.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/joe/joe.hash b/package/joe/joe.hash
index 0a9c1fb8df..1e2de4225e 100644
--- a/package/joe/joe.hash
+++ b/package/joe/joe.hash
@@ -1,5 +1,6 @@
-# From https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-4.4/
-sha1 aedf1ac9e6b91053aa26c70e7bba5bbd8136f033  joe-4.4.tar.gz
-md5 59e63debe60b456a6ee5c0c27a756a47  joe-4.4.tar.gz
+# From https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-4.6/
+sha1 da7712333f676cfb5ae9f3565fd2225c5a2185ca  joe-4.6.tar.gz
+md5 9017484e6116830d846678b625ea5c43  joe-4.6.tar.gz
 # Locally computed:
-sha256 a5704828bbca29acb9e200414fef522c66cdf9ce28150f402d6767da43460979  joe-4.4.tar.gz
+sha256 495a0a61f26404070fe8a719d80406dc7f337623788e445b92a9f6de512ab9de  joe-4.6.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/joe/joe.mk b/package/joe/joe.mk
index 3d0e9f7769..9a3215c4e1 100644
--- a/package/joe/joe.mk
+++ b/package/joe/joe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JOE_VERSION = 4.4
+JOE_VERSION = 4.6
 JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
 JOE_LICENSE = GPL-1.0+
 JOE_LICENSE_FILES = COPYING
-- 
2.20.1
