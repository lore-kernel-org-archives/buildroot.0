From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 May 2020 14:50:04 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/tor: bump version to 0.4.3.5
Message-ID: <20200516125004.1228983-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://blog.torproject.org/node/1872

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index e55f3ea3c2..f5b5fb0e49 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06a1d835ddf382f6bca40a62e8fb40b71b2f73d56f0d53523c8bd5caf9b3026d  tor-0.4.2.7.tar.gz
+sha256  616a0e4ae688d0e151d46e3e4258565da4d443d1ddbd316db0b90910e2d5d868  tor-0.4.3.5.tar.gz
 sha256  ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 09f780d3f5..024fb1ad5d 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.2.7
+TOR_VERSION = 0.4.3.5
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.26.2
