From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Jun 2013 23:13:28 +0200
Subject: [Buildroot] [git commit] cups: fix upstream URL
Message-ID: <20130612211542.ACCD99AD50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca0b3486e1e0ab96e73a29c53bfb326e92151333
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jelle Sels <jellesels@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index f8ace71..9b8d7c5 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -6,7 +6,7 @@
 
 CUPS_VERSION = 1.3.11
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
-CUPS_SITE = http://ftp.easysw.com/pub/cups/$(CUPS_VERSION)
+CUPS_SITE = http://www.cups.org/software/$(CUPS_VERSION)
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
