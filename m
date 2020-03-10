From: =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= <kevin.lhopital@bootlin.com>
Date: Tue, 10 Mar 2020 09:16:37 +0100
Subject: [Buildroot] [PATCH] package/ed: Bump to version 1.16
Message-ID: <20200310081637.3288-1-kevin.lhopital@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: K?vin L'h?pital <kevin.lhopital@bootlin.com>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 96c814d3c2..2544676b06 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From http://lists.gnu.org/archive/html/bug-ed/2019-01/msg00010.html
-sha256	ad4489c0ad7a108c514262da28e6c2a426946fb408a3977ef1ed34308bdfd174	ed-1.15.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2020-02/msg00002.html
+sha256	cfc07a14ab048a758473ce222e784fbf031485bcd54a76f74acfee1f390d8b2c	ed-1.16.tar.lz
 # Locally calculated
 sha256	f03a12bef9dfb7281864a0dd965166d4f4ec7a66633df2bc72fa4363e57de02c	COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 6ef8f951cf..deb900e283 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.15
+ED_VERSION = 1.16
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-3.0+
-- 
2.17.1
