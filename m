From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 21:45:53 +0200
Subject: [Buildroot] [git commit branch/next] mxml: add license information
Message-ID: <20120802195306.2BB4B8F456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bcc51fd1a8a83d1cfb350b7d83e47b8687ef39f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/mxml/mxml.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index af1cb26..03850d0 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -5,6 +5,8 @@
 #############################################################
 MXML_VERSION = 2.7
 MXML_SITE = http://ftp.easysw.com/pub/mxml/$(MXML_VERSION)
+MXML_LICENSE = LGPLv2+ with exceptions
+MXML_LICENSE_FILES = COPYING
 MXML_INSTALL_STAGING = YES
 
 MXML_INSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) install
