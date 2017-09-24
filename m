From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:54:42 +0200
Subject: [Buildroot] [git commit] package/mpfr: bump to version 3.1.6
Message-ID: <20170924140311.E03C180DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d9bf93bc81e052a70fcc18c574d2cc6e3669cb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mpfr/mpfr.hash | 4 ++--
 package/mpfr/mpfr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index d2c32f2..1c825e1 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	015fde82b3979fbe5f83501986d328331ba8ddf008c1ff3da3c238f49ca062bc	mpfr-3.1.5.tar.xz
+# From http://lists.gnu.org/archive/html/info-gnu/2017-09/msg00004.html
+sha256 7a62ac1a04408614fccdc506e4844b10cf0ad2c2b1677097f8f35d3a1344a950  mpfr-3.1.6.tar.xz
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 48dd487..1b67cf2 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 3.1.5
+MPFR_VERSION = 3.1.6
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
