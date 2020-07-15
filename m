From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 17:13:00 +0200
Subject: [Buildroot] [git commit] package/selinux-python: bump to 20200710
Message-ID: <20200715151043.8571B85B4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64535cab4ef9b90e25ef05ef380603489b51ce26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/selinux-python/selinux-python.hash | 2 +-
 package/selinux-python/selinux-python.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 8fb72423e8..f896168f7a 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 43c08fa881ccc64251d396b1ac6c56b354bf98421b4ec937d54a8db190135494 selinux-python-3.0.tar.gz
+sha256 f4d0a1a030bc291a6af498b26e0676b745075dd289a8ba16cdec86c3ea8f2f02 selinux-python-3.1.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index d6c3231786..3b1e15bdf8 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.0
-SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
+SELINUX_PYTHON_VERSION = 3.1
+SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = COPYING
 SELINUX_PYTHON_DEPENDENCIES = python3
