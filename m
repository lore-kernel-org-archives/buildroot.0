From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 18:01:59 +0200
Subject: [Buildroot] [git commit branch/next] flashrom: bump to version
	0.9.6.1
Message-ID: <20120817160213.361A19712B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e5ab3317578ebc8feb95ecffc94253d7de2e204
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
 
