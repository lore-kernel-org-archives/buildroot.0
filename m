From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Jul 2020 22:16:25 +0200
Subject: [Buildroot] [PATCH 2/2] package/fmt: bump version to 7.0.1
In-Reply-To: <20200718201625.29899-1-bernd.kuhls@t-online.de>
References: <20200718201625.29899-1-bernd.kuhls@t-online.de>
Message-ID: <20200718201625.29899-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index da58d45c33..19a8c8d9fe 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5edf8b0f32135ad5fafb3064de26d063571e95e8ae46829c2f4f4b52696bbff0  fmt-6.2.1.tar.gz
+sha256  ac335a4ca6beaebec4ddb2bc35b9ae960b576f3b64a410ff2c379780f0cd4948  fmt-7.0.1.tar.gz
 sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 62c165fbea..cfd4512a89 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 6.2.1
+FMT_VERSION = 7.0.1
 FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
 FMT_LICENSE = MIT with exception
 FMT_LICENSE_FILES = LICENSE.rst
-- 
2.27.0
