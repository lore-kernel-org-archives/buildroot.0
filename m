From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:42 -0000
Subject: [Buildroot] [git commit] package/mbuffer: bump to version 20210328
Message-ID: <20210607144653.2069082B86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da50baa7c9337ffa83d4f910e3dd2032331857bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mbuffer/mbuffer.hash | 4 ++--
 package/mbuffer/mbuffer.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbuffer/mbuffer.hash b/package/mbuffer/mbuffer.hash
index 73a8d3cf44..7c200d543e 100644
--- a/package/mbuffer/mbuffer.hash
+++ b/package/mbuffer/mbuffer.hash
@@ -1,8 +1,8 @@
 # From http://www.maier-komor.de/mbuffer.html
-md5  e2b4f3b0d0944c08d52c167841bde3c0  mbuffer-20200929.tgz
+md5  4e4712db5fbd4e71bfbfa2c145c6c646  mbuffer-20210328.tgz
 
 # Locally computed after checking signature upstream
-sha256  53a6e3c14e9a049f18a09840653dd84f18e7ec7560f2dcf2b61c0ab5f0ead4e8  mbuffer-20200929.tgz
+sha256  51b5b8d8488991a55fe1dfce90130f9e47bc1ce286ba03b4f628c04b784fdc5d  mbuffer-20210328.tgz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/mbuffer/mbuffer.mk b/package/mbuffer/mbuffer.mk
index 90a72ce657..c7c4456651 100644
--- a/package/mbuffer/mbuffer.mk
+++ b/package/mbuffer/mbuffer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBUFFER_VERSION = 20200929
+MBUFFER_VERSION = 20210328
 MBUFFER_SOURCE = mbuffer-$(MBUFFER_VERSION).tgz
 MBUFFER_SITE = http://www.maier-komor.de/software/mbuffer
 MBUFFER_LICENSE = GPL-3.0+
