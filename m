From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 20:10:23 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libnpupnp: bump
 to version 4.0.10
Message-ID: <20210128200123.3E554843AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e55482a42e85edd470c4768be423987106d43ff6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

https://www.lesbonscomptes.com/upmpdcli/releases.html#_2020_07_20_libnpupnp_4_0_10

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b23ef48790a2a54650b4cd66b3c06d23a813225a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 41cc41955b..3bad603269 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.0.7.tar.gz.sha256
-sha256  30f15caa67dc83f76b0976438165aa4704a50c7e3e5444c50bb8cbad874877ca  libnpupnp-4.0.7.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.0.10.tar.gz.sha256
+sha256  a682d0584d79acd5a4d551ae18efc83cb0765624da27fb0edcd47e3fb94418f9  libnpupnp-4.0.10.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index abd80ab63b..4575ad40f2 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.0.7
+LIBNPUPNP_VERSION = 4.0.10
 LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
