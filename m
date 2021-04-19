From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 23:45:06 +0200
Subject: [Buildroot] [git commit] package/libnpupnp: bump to version 4.1.3
Message-ID: <20210419211909.99FC583F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40ebac416b2750bd9af78d2899ebaeec43448008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnpupnp/libnpupnp.hash | 2 +-
 package/libnpupnp/libnpupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 62c6959384..d5053915f1 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
 # Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.1.1.tar.gz.sha256
-sha256  7e41d3933b956073b33c6ac6e61c81e83b428015ee871fd16d18b198bf3be960  libnpupnp-4.1.1.tar.gz
+sha256  74703d49be52d29b52f59342ec7359178b127568399551d9d3f56bb7950fcc02  libnpupnp-4.1.3.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index fa7181ff98..0efddbf67f 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.1.1
+LIBNPUPNP_VERSION = 4.1.3
 LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
