From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 22:27:07 +0200
Subject: [Buildroot] [git commit] harfbuzz: bump version to 1.4.6
Message-ID: <20170424203123.CF0E882765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b53e4f0bb8c0cb55e277d66ad4fe5517512dcef5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index f4fb849..f487191 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.5.tar.bz2.sha256
-sha256 d0e05438165884f21658154c709075feaf98c93ee5c694b951533ac425a9a711  harfbuzz-1.4.5.tar.bz2
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.6.tar.bz2.sha256
+sha256 21a78b81cd20cbffdb04b59ac7edfb410e42141869f637ae1d6778e74928d293  harfbuzz-1.4.6.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 39e2cfe..f9814ca 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.4.5
+HARFBUZZ_VERSION = 1.4.6
 HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
