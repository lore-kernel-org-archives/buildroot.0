From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 20:41:03 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libnpupnp:
 security bump to version 4.1.4
Message-ID: <20210426203327.E8262815DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcf8b12ffd7b1d3b59ceb3fb5daf3935725da53c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix vulnerability to DNS-rebind attacks.

This security fix addresses the same vulnerability isue which was reported
for libupnp (which libnpupnp is derived from) in CVE-2021-29462.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit adea5b316e27ae7d7e6ec09fa33a204754cc4de6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index d5053915f1..8451812eb7 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.1.1.tar.gz.sha256
-sha256  74703d49be52d29b52f59342ec7359178b127568399551d9d3f56bb7950fcc02  libnpupnp-4.1.3.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.1.4.tar.gz.sha256
+sha256  03506f02546e3b3d31b389e046c4691f020b82d315426ce79f1e2b1eb7958656  libnpupnp-4.1.4.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index 0efddbf67f..6c6fa2f149 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.1.3
+LIBNPUPNP_VERSION = 4.1.4
 LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
