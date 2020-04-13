From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Apr 2020 10:47:52 +0300
Subject: [Buildroot] [PATCH] package/strace: bump to version 5.6
Message-ID: <45d59d72dedcd82219aa60fe86076a977b3f7516.1586764072.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 5b645ebe7e1d..720f358c5b99 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.5/strace-5.5.tar.xz.asc
-sha256  9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff  strace-5.5.tar.xz
+# https://strace.io/files/5.6/strace-5.6.tar.xz.asc
+sha256  189968eeae06ed9e20166ec55a830943c84374676a457c9fe010edc7541f1b01  strace-5.6.tar.xz
 sha256  6370eb67db918210944a8511a6995ebe9567852f26b4f15a01e5c8cf2aef7c46  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 569a822e4292..5c101419f411 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.5
+STRACE_VERSION = 5.6
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.25.1
