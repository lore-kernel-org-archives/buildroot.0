From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 10:30:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.3.0.8
Message-ID: <20170610083053.20683-1-bernd.kuhls@t-online.de>
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
index bfdf055f4..71868fd1b 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9640c4448ef3cad7237c68ed6984e705db8fb2b9d6bb74c8815d01bb06527d02  tor-0.3.0.7.tar.gz
+sha256 663a3ba7b8a124c0f8a7351eaa2dda6fd518de3f3c4ee28fff869bfb03860d48  tor-0.3.0.8.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 305f6bf40..dc2823d46 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.0.7
+TOR_VERSION = 0.3.0.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.11.0
