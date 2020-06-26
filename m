From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 27 Jun 2020 00:05:59 +0200
Subject: [Buildroot] [PATCH 1/4] package/liburcu: bump version to 0.12.1
Message-ID: <20200626220603.29561-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update hash file formatting (2 spaces).

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/liburcu/liburcu.hash | 12 ++++++------
 package/liburcu/liburcu.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 5c2f7e52a8..da7d12a76c 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,8 +1,8 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.11.1.tar.bz2.sha256
-sha256 92b9971bf3f1c443edd6c09e7bf5ff3b43531e778841f16377a812c8feeb3350  userspace-rcu-0.11.1.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.12.1.tar.bz2.sha256
+sha256  bbfaead0345642b97e0de90f889dfbab4b2643a6a5e5c6bb59cd0d26fc0bcd0e  userspace-rcu-0.12.1.tar.bz2
 
 # Hash for license files
-sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
-sha256 8ef8121eddd2fc0779d94331a1d0f1ead9c796343d845e564cd8c8c4ae3d6f6e  lgpl-relicensing.txt
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
-sha256 e8c070cb093be4b2eaf938a5f1c11621163b2d9cfa2790460cf925d81e442fa7  LICENSE
+sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
+sha256  8ef8121eddd2fc0779d94331a1d0f1ead9c796343d845e564cd8c8c4ae3d6f6e  lgpl-relicensing.txt
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
+sha256  e8c070cb093be4b2eaf938a5f1c11621163b2d9cfa2790460cf925d81e442fa7  LICENSE
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 217e90a1b1..fa2ad0de83 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.11.1
+LIBURCU_VERSION = 0.12.1
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
-- 
2.27.0
