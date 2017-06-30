From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Jun 2017 19:27:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/fmt: bump version to 4.0.0
Message-ID: <20170630172714.31294-1-bernd.kuhls@t-online.de>
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
index beb120b12..47087a417 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	dce62ab75a161dd4353a98364feb166d35e7eea382169d59d9ce842c49c55bad fmt-3.0.1.tar.gz
+sha256 35300a0d356529447a79ed5ccf419239d8b34f916e5d4625f046fd37afa3650a  fmt-4.0.0.tar.gz
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index b7e3db03b..c47b03e83 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 3.0.1
+FMT_VERSION = 4.0.0
 FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
 FMT_LICENSE = BSD-2-Clause
 FMT_LICENSE_FILES = LICENSE.rst
-- 
2.11.0
