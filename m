From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 00:31:38 +0200
Subject: [Buildroot] [git commit] package/xbmc: Bump version to 13.2
Message-ID: <20140817224143.D777C9D45F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b543976380715724978134a844880b1eb3386239
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xbmc/xbmc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index eaa21c9..bdd634e 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XBMC_VERSION = 13.2rc1-Gotham
+XBMC_VERSION = 13.2-Gotham
 XBMC_SOURCE = $(XBMC_VERSION).tar.gz
 XBMC_SITE = https://github.com/xbmc/xbmc/archive
 XBMC_LICENSE = GPLv2
