From: Florian La Roche <florian.laroche@googlemail.com>
Date: Fri, 30 Oct 2020 11:24:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: bump to version 1.9
Message-ID: <20201030102426.47787-1-Florian.LaRoche@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Florian La Roche <Florian.LaRoche@gmail.com>
---
 package/rt-tests/rt-tests.hash | 2 +-
 package/rt-tests/rt-tests.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index 8080415802..66834006d8 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,4 +1,4 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/rt-tests/sha256sums.asc
-sha256 bda8f08e13d1022e7de6faf8762b4e831afc4e85f79bdf9c9101f84225b23f53  rt-tests-1.8.tar.xz
+sha256 611c5a2b02964ab778e037ae16402e8d1cb8456628c7ca38d85a7548f33e52e3  rt-tests-1.9.tar.xz
 # locally computed hash
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index c17b7fe982..26c257213b 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -6,7 +6,7 @@
 
 RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
-RT_TESTS_VERSION = 1.8
+RT_TESTS_VERSION = 1.9
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
 RT_TESTS_DEPENDENCIES = numactl
-- 
2.28.0
