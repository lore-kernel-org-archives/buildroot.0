From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Nov 2018 12:17:45 +0200
Subject: [Buildroot] [PATCH next] strace: bump to version 4.25
Message-ID: <daeb6e28d7b1375a361162c2e4b9daf001afcd03.1543313865.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release also fixes compatibility with kernel 4.19 headers.

Fixes:
http://autobuild.buildroot.net/results/0763988c35a1de7d51c7094b5b002ed369f1a25f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index c6450b1c5186..f7d652faaaec 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/4.23/strace-4.23.tar.xz
-sha256	7860a6965f1dd832747bd8281a04738274398d32c56e9fbd0a68b1bb9ec09aad	strace-4.23.tar.xz
+# https://strace.io/files/4.25/strace-4.25.tar.xz.asc
+sha256	d685f8e65470b7832c3aff60c57ab4459f26ff89f07c10f92bd70ee89efac701	strace-4.25.tar.xz
 sha256	df862ba273812c589fd69acc74197a25d38c5295baccab00a62d39d1894c0253	COPYING
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 10869453d146..d663a6123d2d 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.23
+STRACE_VERSION = 4.25
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3-Clause
-- 
2.19.2
