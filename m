From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  1 Aug 2012 07:48:58 +0300
Subject: [Buildroot] [PATCH 2/3] mxml: add license information
In-Reply-To: <5d40aa0e8f5d5dc6b863bf1a0af427a377e75989.1343796460.git.baruch@tkos.co.il>
References: <5d40aa0e8f5d5dc6b863bf1a0af427a377e75989.1343796460.git.baruch@tkos.co.il>
Message-ID: <9e9f83eae727c218f9ee7cfc2a7d86772a12a308.1343796460.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mxml/mxml.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index af1cb26..807de11 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -5,6 +5,8 @@
 #############################################################
 MXML_VERSION = 2.7
 MXML_SITE = http://ftp.easysw.com/pub/mxml/$(MXML_VERSION)
+MXML_LICENSE = LGPLv2+
+MXML_LICENSE_FILES = COPYING
 MXML_INSTALL_STAGING = YES
 
 MXML_INSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) install
-- 
1.7.10.4
