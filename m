From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:57:17 +0200
Subject: [Buildroot] [git commit] isl: bump to version 0.14.1
Message-ID: <20150704125726.D9ABD7FE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b50da9ac44d89e751f9da6ff4317adf12be2fe7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/isl/isl.hash |    2 ++
 package/isl/isl.mk   |    6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
new file mode 100644
index 0000000..e2c14ad
--- /dev/null
+++ b/package/isl/isl.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	8882c9e36549fc757efa267706a9af733bb8d7fe3905cbfde43e17a89eea4675	isl-0.14.1.tar.xz
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 55cff9d..bb79039 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-# The latest 0.13 version is not yet compatible with cloog 0.18.2, so
+# The latest 0.15 version is not yet compatible with cloog 0.18.3, so
 # bumping isl is not possible until a new version of cloog is
 # published.
-ISL_VERSION = 0.12.2
-ISL_SOURCE = isl-$(ISL_VERSION).tar.bz2
+ISL_VERSION = 0.14.1
+ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = http://isl.gforge.inria.fr
 ISL_LICENSE = MIT
 ISL_LICENSE_FILES = LICENSE
