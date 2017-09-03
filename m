From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Sep 2017 13:22:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/stella: bump version to 5.0.2
Message-ID: <20170903112241.24199-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Please note that this bump does not fix this build error:
http://autobuild.buildroot.net/?reason=stella-5.0.1

 package/stella/stella.hash | 2 +-
 package/stella/stella.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 15e75c1e8..ef17ff75a 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 34ff90b60a4d277ada2815c4d65eda18c87371d0fb15e872b8ac82aac3e0b07a  stella-5.0.1-src.tar.xz
+sha256 74ee708b68340b65519a04a22c61921cdcf69a1d308600c212414b28e9e689ac  stella-5.0.2-src.tar.xz
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 7f4e45ea1..158a51109 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 5.0.1
+STELLA_VERSION = 5.0.2
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
-- 
2.11.0
