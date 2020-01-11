From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 10:02:22 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python3: bump
 version to 3.7.6
Message-ID: <20200111085242.AD47888555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ca73f0f7bad7ad429aae63fcede0257877bb27b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

For additional fixes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index a138724ff8..6e99cae59b 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-375/
-md5 08ed8030b1183107c48f2092e79a87e2 Python-3.7.5.tar.xz
+# From https://www.python.org/downloads/release/python-376/
+md5 c08fbee72ad5c2c95b0f4e44bf6fd72c Python-3.7.6.tar.xz
 # Locally computed
-sha256 e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94 Python-3.7.5.tar.xz
+sha256 55a2cce72049f0794e9a11a84862e9039af9183603b78bc60d89539f82cf533f Python-3.7.6.tar.xz
 sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 625c059135..7f93372c22 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.7
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
