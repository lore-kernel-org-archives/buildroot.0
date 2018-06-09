From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Jun 2018 10:13:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.3.3.6
Message-ID: <20180609081304.7972-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://blog.torproject.org/tor-0336-released-new-stable-series

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 2841d4099a..ca015a8dc0 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 60df77c31dcf94fdd686c8ca8c34f3b70243b33a7344ecc0b719d5ca2617cbee  tor-0.3.2.10.tar.gz
+sha256 99bc59f6dbf395894de12f3a83b3251a82dfd93dc7f6d3afcbbd80f6111433b7  tor-0.3.3.6.tar.gz
 sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 4a1a48357f..f7af718b9b 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.2.10
+TOR_VERSION = 0.3.3.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.17.1
