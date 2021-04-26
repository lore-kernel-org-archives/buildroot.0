From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 20:40:16 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libnpupnp: bump
 to version 4.1.1
Message-ID: <20210426203327.CB5A285F4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a20c0234ec7fbf796fff1e7d923f72ca5cd4b3cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

From https://www.lesbonscomptes.com/upmpdcli/pages/releases.html:

2021-03-13 libnpupnp 4.1.1
 * Fix HEAD requests. Samsung TVs now work with Gerbera + libnpupnp

2021-03-13 libnpupnp 4.1.0
 * Send SERVER and USER-AGENT headers in misc places where mandated or useful.
 * Add API for the client code to set the user-agent and server string values
 * Fix building and running with --disable-ipv6
 * Misc portability fixes.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e1fa1334d0da80abe87540239616308ed4fc8c61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index ce39db4d8d..62c6959384 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.0.14.tar.gz.sha256
-sha256  ea5f5bf388bf8c028a25630c58e9a42762fddd357e7e2581b192856e01aad044  libnpupnp-4.0.14.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.1.1.tar.gz.sha256
+sha256  7e41d3933b956073b33c6ac6e61c81e83b428015ee871fd16d18b198bf3be960  libnpupnp-4.1.1.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index efffd7f8a5..fa7181ff98 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.0.14
+LIBNPUPNP_VERSION = 4.1.1
 LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
