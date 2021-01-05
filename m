From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue,  5 Jan 2021 08:05:40 -0600
Subject: [Buildroot] [PATCH] package/c-periphery: bump to v2.3.1
Message-ID: <20210105140540.154360-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/c-periphery/c-periphery.hash | 2 +-
 package/c-periphery/c-periphery.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index daebb0435f..516cfb33e5 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d31fb19c2645b9658ad5ca9313c7f0488c16a52e5adf8b2845e1955ad94546ae  c-periphery-2.2.4.tar.gz
+sha256  ba298aac5c1f6ebe2b89ed623a2f678bedfa3b9dc78aaf4f0534a1dd304629da  c-periphery-2.3.1.tar.gz
 sha256  7121a0a2ba36ed9388be2f1a916f0e3584d8e49cc7888fbcfcf83bab2a8bebef  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index ce0e03f1e9..dcc82f19c0 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 2.2.4
+C_PERIPHERY_VERSION = 2.3.1
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 C_PERIPHERY_LICENSE = MIT
-- 
2.25.1
