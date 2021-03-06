From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:13:59 +0100
Subject: [Buildroot] [git commit] package/strace: bump to version 5.11
Message-ID: <20210308072139.E114981607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=065820d06733722c297d8ea44078b24321e7f727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update COPYING: copyright year update, and added note about the bundled
Linux UAPI headers. Upstream commit 5bd8364f4202d ("Introduce bundled
directory") says:

   According to analysis made by Kent Gibson at [1], we are allowed to
   re-distribute unmodified Linux kernel UAPI headers under the same
   terms as they are provided by the Linux kernel, and such
   re-distribution does not affect the license of strace itself.

   [1] https://lore.kernel.org/linux-gpio/20210128032641.GA11655 at sol/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 7b211c78b9..e4fe690f61 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.10/strace-5.10.tar.xz.asc
-sha256  fe3982ea4cd9aeb3b4ba35f6279f0b577a37175d3282be24b9a5537b56b8f01c  strace-5.10.tar.xz
-sha256  6370eb67db918210944a8511a6995ebe9567852f26b4f15a01e5c8cf2aef7c46  COPYING
+# https://strace.io/files/5.11/strace-5.11.tar.xz.asc
+sha256  ffe340b10c145a0f85734271e9cce56457d23f21a7ea5931ab32f8cf4e793879  strace-5.11.tar.xz
+sha256  f847d5ef26ad1151ca63bb88536b23a4cac5040c67917f3d5ee7ea1316e2b736  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 646be41e5b..e3e255fd61 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.10
+STRACE_VERSION = 5.11
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
