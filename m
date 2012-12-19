From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Dec 2012 14:47:05 +0100
Subject: [Buildroot] [git commit] orc: bump to version 0.4.16
Message-ID: <20121219140106.08E629A3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e51fd21cc4e58d6f9b8baad6e5d4a922b4e5841a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gstreamer-1.0 plug-ins require this version for ORC
acceleration.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/orc/orc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 842ef25..77cb29f 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -3,7 +3,7 @@
 # orc
 #
 #############################################################
-ORC_VERSION = 0.4.14
+ORC_VERSION = 0.4.16
 ORC_SITE = http://code.entropywave.com/download/orc/
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
