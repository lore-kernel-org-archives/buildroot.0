From: Dick Olsson <hi@senzilla.io>
Date: Tue, 27 Apr 2021 22:42:55 +0000
Subject: [Buildroot] [PATCH 08/10] package/s6-networking: bump to version
 2.4.1.1
Message-ID: <upa7YwPN68RnIbprSUB4pGfPUejakVIJUcp6KhzNYc@cp3-web-033.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change hash file indentation to 2 spaces.

https://www.mail-archive.com/skaware at list.skarnet.org/msg01579.html

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/s6-networking/s6-networking.hash | 4 ++--
 package/s6-networking/s6-networking.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index 9eda72130e..9e333866d3 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 cc1f80eec0ce8227bf058a1371978e4e78274b3c1b0fa82d9dadbdb0bdb27c08  s6-networking-2.4.1.0.tar.gz
-sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  a3fbca789dc5c82b3055fdbd2f55110902198f3136447617ce8f8b79fa8aa554  s6-networking-2.4.1.1.tar.gz
+sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index d687c567cd..24bb2b770f 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_NETWORKING_VERSION = 2.4.1.0
+S6_NETWORKING_VERSION = 2.4.1.1
 S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
-- 
2.30.2
