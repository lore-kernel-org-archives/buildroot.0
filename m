From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 20:23:02 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libupnpp: bump to
 version 0.19.3
Message-ID: <20210128200123.64C83843AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e9fad6b86a819ee648bc7dde4e3800635774d1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

https://www.lesbonscomptes.com/upmpdcli/releases.html#_2020_07_04_libupnpp_0_19_3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dd7eb9514b82b88bc5ae7d396858a6c361b640c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index fb510236a3..dde0d970cb 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.19.2.tar.gz.sha256
-sha256  c9623533271605c92dfa603f5fe0ab6d3d5b4384a0c9173800784f4aa643a190  libupnpp-0.19.2.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.19.3.tar.gz.sha256
+sha256  a16f35ef1ce3d687e9599422c09677c2c1591bfcf68e242931082d4561f66be4  libupnpp-0.19.3.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index ef1816166e..a8db575984 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.19.2
+LIBUPNPP_VERSION = 0.19.3
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
