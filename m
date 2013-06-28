From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 21:22:23 +0200
Subject: [Buildroot] [git commit] cups: define license
Message-ID: <20130628195141.045BE9B291@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50fa1d7c9345c857408fb79389df5ff2d80a52ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 9b8d7c5..8a761a3 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -7,6 +7,8 @@
 CUPS_VERSION = 1.3.11
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
 CUPS_SITE = http://www.cups.org/software/$(CUPS_VERSION)
+CUPS_LICENSE = GPLv2 LGPLv2
+CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
