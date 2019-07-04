From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jul 2019 08:04:37 +0200
Subject: [Buildroot] [git commit] package/libev: bump to version 4.27
Message-ID: <20190704060335.6CB8B7FC66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dae60f4bd300a3ec501f5595f1b385dcc51b9f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libev/libev.hash | 2 +-
 package/libev/libev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libev/libev.hash b/package/libev/libev.hash
index ba9d654bee..9ab341dedd 100644
--- a/package/libev/libev.hash
+++ b/package/libev/libev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 973593d3479abdf657674a55afe5f78624b0e440614e2b8cb3a07f16d4d7f821  libev-4.24.tar.gz
+sha256 2d5526fc8da4f072dd5c73e18fbb1666f5ef8ed78b73bba12e195cfdd810344e  libev-4.27.tar.gz
 sha256 c4dd1a5bc38b041a320b93c5d6c08f5c41a63f2ce718ee16cfcb757fad448199  LICENSE
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 5d9020cd52..2b2d5db004 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEV_VERSION = 4.24
+LIBEV_VERSION = 4.27
 LIBEV_SITE = http://dist.schmorp.de/libev/Attic
 LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
