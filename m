From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Oct 2019 17:50:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/stella: bump to version 6.0.2
Message-ID: <20191012155053.14896-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash of Copyright due to bump in year:
https://github.com/stella-emu/stella/commit/d8831d3b7e1ec8c5d24a75b6e858eeed03c3132b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stella/stella.hash | 4 ++--
 package/stella/stella.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index b0b8aeec69..395ee18d35 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 d611f98bb35ed9eacfb63826b12b4e8b67b874a2a87019d4bdaf1e7f4724c40d  stella-6.0.1-src.tar.xz
-sha256 c946a9ee632ee40111bad6e81c84b3e0bc1e49183b7a809f05d4d371f5f587bb  Copyright.txt
+sha256 bcbd82294f97d00457fdb727e9b08ff73b685dc7f77704cea1eceb58d8967387  stella-6.0.2-src.tar.xz
+sha256 062e708b8b88ea911b5c08000f1c4a5588235aa0c303bc893b5d92fb45cafd04  Copyright.txt
 sha256 58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 01520532ee..1295b75274 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.0.1
+STELLA_VERSION = 6.0.2
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
-- 
2.23.0
