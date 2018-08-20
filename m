From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Aug 2018 19:57:08 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/fmt: bump version to 5.1.0
Message-ID: <20180820175708.631-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fmt/fmt.hash | 3 ++-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 47087a4175..78665d2fa7 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 35300a0d356529447a79ed5ccf419239d8b34f916e5d4625f046fd37afa3650a  fmt-4.0.0.tar.gz
+sha256 73d4cab4fa8a3482643d8703de4d9522d7a56981c938eca42d929106ff474b44  fmt-5.1.0.tar.gz
+sha256 560d39617dfb4b4e4088597291a070ed6c3a8d67668114ed475c673430c3e49a  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index c47b03e834..39fd7e22d9 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 4.0.0
+FMT_VERSION = 5.1.0
 FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
 FMT_LICENSE = BSD-2-Clause
 FMT_LICENSE_FILES = LICENSE.rst
-- 
2.18.0
