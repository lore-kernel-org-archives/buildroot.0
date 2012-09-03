From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:06:12 -0000
Subject: [Buildroot] [git commit] flashrom: bump to version 0.9.6.1
Message-ID: <20120903200542.7AD8999543@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e5ab3317578ebc8feb95ecffc94253d7de2e204
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flashrom/flashrom.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 4b310ef..675cc6e 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -3,7 +3,7 @@
 # flashrom
 #
 #############################################################
-FLASHROM_VERSION = 0.9.3
+FLASHROM_VERSION = 0.9.6.1
 FLASHROM_SOURCE  = flashrom-$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE    = http://download.flashrom.org/releases
 
