From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:31:32 +0200
Subject: [Buildroot] [git commit] package/strace: bump to version 5.8
Message-ID: <20200907192557.BE00386B2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b56750d574c01e489b01f205a21e5059b88e466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 0337558244..b090442b68 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.7/strace-5.7.tar.xz.asc
-sha256  b284b59f9bcd95b9728cea5bd5c0edc5ebe360af73dc76fbf6334f11c777ccd8  strace-5.7.tar.xz
+# https://strace.io/files/5.8/strace-5.8.tar.xz.asc
+sha256  df4a669f7fff9cc302784085bd4b72fab216a426a3f72c892b28a537b71e7aa9  strace-5.8.tar.xz
 sha256  6370eb67db918210944a8511a6995ebe9567852f26b4f15a01e5c8cf2aef7c46  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index ec88690f24..8403e09cbd 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.7
+STRACE_VERSION = 5.8
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
