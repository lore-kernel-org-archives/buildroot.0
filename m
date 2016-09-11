From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:34:51 +0200
Subject: [Buildroot] [git commit] package/libupnpp: bump to version 0.15.0
Message-ID: <20160911133515.B90A481696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=139c7f980038d16787d9d35fdf500b4603d0dfa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index 685ccf4..4edc3b9 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.14.1.tar.gz.sha256
-sha256  ffb33379f3734419de683b0adca5228e802c64d3960681c15f3a8de7d7e315d1  libupnpp-0.14.1.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.15.0.tar.gz.sha256
+sha256  5578389c1928a84cd8ec05c127321b44e2bfafaf3b02ebb8b1d10c10ae2b0aeb  libupnpp-0.15.0.tar.gz
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 1525f81..7d21a88 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.14.1
+LIBUPNPP_VERSION = 0.15.0
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = GPLv2+
 LIBUPNPP_LICENSE_FILES = COPYING
