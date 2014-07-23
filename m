From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 22:04:29 +0200
Subject: [Buildroot] [git commit] xbmc: Bump version to 13.2b2
Message-ID: <20140723200905.204CD9D2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a03dd891dce6e19f00117fd8615c7b383a1c449
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/xbmc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 45be990..2a38114 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XBMC_VERSION = 13.1-Gotham
+XBMC_VERSION = 13.2b2-Gotham
 XBMC_SOURCE = $(XBMC_VERSION).tar.gz
 XBMC_SITE = https://github.com/xbmc/xbmc/archive
 XBMC_LICENSE = GPLv2
