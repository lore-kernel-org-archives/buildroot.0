From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  8 Dec 2019 12:19:30 -0800
Subject: [Buildroot] [PATCH 08/11] package/selinux-python: bump version to
 3.0
In-Reply-To: <20191208201933.3832327-1-aduskett@gmail.com>
References: <20191208201933.3832327-1-aduskett@gmail.com>
Message-ID: <20191208201933.3832327-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/selinux-python/selinux-python.hash | 2 +-
 package/selinux-python/selinux-python.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 8cbac37016..8fb72423e8 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 3650b5393b0d1790cac66db00e34f059aa91c23cfe3c2559676594e295d75fde selinux-python-2.9.tar.gz
+sha256 43c08fa881ccc64251d396b1ac6c56b354bf98421b4ec937d54a8db190135494 selinux-python-3.0.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 978bee7c88..cbd94f962b 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 2.9
-SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
+SELINUX_PYTHON_VERSION = 3.0
+SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = COPYING
 
-- 
2.23.0
