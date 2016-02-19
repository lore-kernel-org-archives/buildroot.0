From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Feb 2016 16:33:13 +0100
Subject: [Buildroot] [git commit] package/libupnpp: bump to version 0.14.1
Message-ID: <20160302202752.CD84B80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d98aae3bca4f1ca8ebcabb025ed94a1bbb5cba72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index a301fb3..685ccf4 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.13.1.tar.gz.sha256
-sha256 d4604e3e4875e99d0446a436f857a849d1e3dda59096861dcd6a0e6c16474cb7  libupnpp-0.13.1.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.14.1.tar.gz.sha256
+sha256  ffb33379f3734419de683b0adca5228e802c64d3960681c15f3a8de7d7e315d1  libupnpp-0.14.1.tar.gz
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 71ba311..1525f81 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.13.1
+LIBUPNPP_VERSION = 0.14.1
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = GPLv2+
 LIBUPNPP_LICENSE_FILES = COPYING
