From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:02:18 +0200
Subject: [Buildroot] [git commit] package/tor: bump version to 0.3.3.7
Message-ID: <20180617120014.A737888802@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88813806cb45b5bf50b99f90b9718ccafdfdb63f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://blog.torproject.org/tor-0337-released

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index ca015a8dc0..554d5906b6 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 99bc59f6dbf395894de12f3a83b3251a82dfd93dc7f6d3afcbbd80f6111433b7  tor-0.3.3.6.tar.gz
+sha256 ea6bb512c4adfbc4e05b22e4c2d06bddff5b358a53de982273fec846b75bde0c  tor-0.3.3.7.tar.gz
 sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index f7af718b9b..39006e7caf 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.3.6
+TOR_VERSION = 0.3.3.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
