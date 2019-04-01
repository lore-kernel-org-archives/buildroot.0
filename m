From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:43:00 +0200
Subject: [Buildroot] [git commit] package/fmt: bump version to 5.3.0
Message-ID: <20190401203924.A8F9C86FEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62797bd01a9f0f62f4bb7d52ad666ac82ffee17c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 78665d2fa7..a124a1b7ed 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 73d4cab4fa8a3482643d8703de4d9522d7a56981c938eca42d929106ff474b44  fmt-5.1.0.tar.gz
+sha256 defa24a9af4c622a7134076602070b45721a43c51598c8456ec6f2c4dbb51c89  fmt-5.3.0.tar.gz
 sha256 560d39617dfb4b4e4088597291a070ed6c3a8d67668114ed475c673430c3e49a  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 39fd7e22d9..17dfb87b74 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 5.1.0
+FMT_VERSION = 5.3.0
 FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
 FMT_LICENSE = BSD-2-Clause
 FMT_LICENSE_FILES = LICENSE.rst
