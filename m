From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Apr 2021 21:17:29 +0200
Subject: [Buildroot] [git commit] package/s6-networking: bump to version
 2.4.1.0
Message-ID: <20210407185256.D9742825B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e88edae046e79b0d29c0ced854dd4cd58a581ab1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license hash due to year change.

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1535:lpehbljhhcpaopbnkkbf

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/s6-networking/s6-networking.hash | 4 ++--
 package/s6-networking/s6-networking.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index 41ceda0c05..9eda72130e 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 9d411b5f742529be8e14da0a21635fcc304a4d7ac05fe0e45cf2355e5e3cf188  s6-networking-2.3.1.1.tar.gz
-sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
+sha256 cc1f80eec0ce8227bf058a1371978e4e78274b3c1b0fa82d9dadbdb0bdb27c08  s6-networking-2.4.1.0.tar.gz
+sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
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
