From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Wed,  6 Nov 2019 16:20:11 +0100
Subject: [Buildroot] [PATCH] package/ofono: bump to version 1.31
Message-ID: <20191106152011.28564-1-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/ofono/ofono.hash | 2 +-
 package/ofono/ofono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index e8e972af21..02245a46f4 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256 8079735efc5d7f33be9e792e791f2f7ff75c31ce67d477b994673e32319eec5c  ofono-1.30.tar.xz
+sha256 a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b69624f33d859e9b  ofono-1.31.tar.xz
 # Locally computed
 sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 5a0b73879f..38b90bd732 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.30
+OFONO_VERSION = 1.31
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_AUTORECONF = YES
-- 
2.11.0
