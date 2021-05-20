From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 May 2021 10:46:47 -0700
Subject: [Buildroot] [PATCH/NEXT: 09/11] package/selinux-python: bump to
 version 3.2
In-Reply-To: <20210520174649.1188340-1-aduskett@gmail.com>
References: <20210520174649.1188340-1-aduskett@gmail.com>
Message-ID: <20210520174649.1188340-10-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/selinux-python/selinux-python.hash | 2 +-
 package/selinux-python/selinux-python.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index f896168f7a..00c28b722c 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 f4d0a1a030bc291a6af498b26e0676b745075dd289a8ba16cdec86c3ea8f2f02 selinux-python-3.1.tar.gz
+sha256 770855ea8120ef23007fdb9db94b1ed6e8cd77917b584ed8877bbee9c16e74fb selinux-python-3.2.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 3b1e15bdf8..61ec7eb595 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.1
-SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
+SELINUX_PYTHON_VERSION = 3.2
+SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = COPYING
 SELINUX_PYTHON_DEPENDENCIES = python3
-- 
2.31.1
