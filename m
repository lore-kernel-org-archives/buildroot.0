From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Mar 2017 17:32:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.2.9.10
Message-ID: <20170311163259.12142-1-bernd.kuhls@t-online.de>
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
index 470fc4829..d14db040e 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 33325d2b250fd047ba2ddc5d11c2190c4e2951f4b03ec48ebd8bf0666e990d43  tor-0.2.9.9.tar.gz
+sha256 d611283e1fb284b5f884f8c07e7d3151016851848304f56cfdf3be2a88bd1341  tor-0.2.9.10.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index bb0fbb16b..9ccde799d 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.9.9
+TOR_VERSION = 0.2.9.10
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3c
 TOR_LICENSE_FILES = LICENSE
-- 
2.11.0
