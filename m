From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 17:58:02 +0000
Subject: [Buildroot] [PATCH 8/9] package/s6-networking: bump to version
 2.4.1.0
Message-ID: <XJ2XuC2AhlwPdFzZEDIVt9YjO55jo09h4orjan4DIMI@cp4-web-014.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1535:lpehbljhhcpaopbnkkbf

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/s6-networking/s6-networking.hash | 2 +-
 package/s6-networking/s6-networking.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index 41ceda0c05..e9dd82e2b2 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 9d411b5f742529be8e14da0a21635fcc304a4d7ac05fe0e45cf2355e5e3cf188  s6-networking-2.3.1.1.tar.gz
+sha256 cc1f80eec0ce8227bf058a1371978e4e78274b3c1b0fa82d9dadbdb0bdb27c08  s6-networking-2.4.1.0.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index c23445b967..d687c567cd 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_NETWORKING_VERSION = 2.3.1.1
+S6_NETWORKING_VERSION = 2.4.1.0
 S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
-- 
2.30.2
