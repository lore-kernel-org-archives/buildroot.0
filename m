From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:15:00 +0200
Subject: [Buildroot] [git commit] harfbuzz: bump to 1.5.0
Message-ID: <20170905190741.71C7F82131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96b2e7a8c8115473d46bb6fc6313cb89b443e2e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index f487191..d44bd56 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.6.tar.bz2.sha256
-sha256 21a78b81cd20cbffdb04b59ac7edfb410e42141869f637ae1d6778e74928d293  harfbuzz-1.4.6.tar.bz2
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.5.0.tar.bz2.sha256
+sha256 c088ec363be8d03f7708feb76dd22d5f102678e67d6ce63b02496ca0beb64ac1  harfbuzz-1.5.0.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index f9814ca..0ee6a6b 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.4.6
+HARFBUZZ_VERSION = 1.5.0
 HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
