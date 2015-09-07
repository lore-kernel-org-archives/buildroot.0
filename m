From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Sep 2015 23:58:41 +0200
Subject: [Buildroot] [git commit] package/libupnpp: bump to version 0.12.1
Message-ID: <20150907221138.2D7507FA68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=637b209268ad398275c7d673911f2b37fafee4eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnpp/libupnpp.hash |    4 ++--
 package/libupnpp/libupnpp.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index ae935c1..52a0b19 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.11.0.tar.gz.sha256
-sha256 e7ceab4313226010b6064f65aa156fa04c25af4d5ae4c23a18303e2034fbca05  libupnpp-0.11.0.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.12.1.tar.gz.sha256
+sha256 a70b51827875a75860b07d21b709f285e73e3843cf80e272f67afeb08100dc2c  libupnpp-0.12.1.tar.gz
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 1075ff9..b274433 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.11.0
+LIBUPNPP_VERSION = 0.12.1
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = GPLv2+
 LIBUPNPP_LICENSE_FILES = COPYING
