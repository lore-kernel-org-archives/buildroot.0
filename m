From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Jul 2017 09:46:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.3.0.9
Message-ID: <20170701074620.25403-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 71868fd1b..618acdc24 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 663a3ba7b8a124c0f8a7351eaa2dda6fd518de3f3c4ee28fff869bfb03860d48  tor-0.3.0.8.tar.gz
+sha256 48d4880bf6ccb19ce9af2abde6946d7cf0635cc807548badbf4a221a79581e42  tor-0.3.0.9.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index dc2823d46..0fa17e664 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.0.8
+TOR_VERSION = 0.3.0.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.11.0
