From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  9 Oct 2020 15:32:23 +0300
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: bump to version 3.10.0
Message-ID: <20201009123223.82070-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 8fd37ff47a..4e03ba4a87 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  9e076ae757a09cac9ce1beb50b3361ae83a831e5abc0f1bf5cdf771cd1320338  libfuse3-3.9.4.tar.gz
+sha256  52bbb52035f7eeaa54d139e21805d357f848f6e02ac956831d04988165a92c7b  libfuse3-3.10.0.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 6e679fe5a8..f6d8dd0ab9 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.9.4
+LIBFUSE3_VERSION = 3.10.0
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.26.2
