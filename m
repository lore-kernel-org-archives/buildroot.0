From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:34:59 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 1.2.2
Message-ID: <20160911133515.C546D81696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57d0a568da4dd3e49c06af79a24ecaafaf14cbe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream did not provide a hash file, so the hash was calculated
manually.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 27a75cc..7e23adc 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.1.3.tar.gz.sha256
-sha256  2df3e6593f18c097b6247fb8da919b94701bf083b219056b006d68e6dcef75b5  upmpdcli-1.1.3.tar.gz
+# Manually calculated:
+sha256  6a3ad211707d7eca287f7f64688ff2e569d50bc463aa2145b01c98252fe30955  upmpdcli-1.2.2.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 1a7c790..a7b98c9 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.1.3
+UPMPDCLI_VERSION = 1.2.2
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
