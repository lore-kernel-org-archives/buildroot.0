From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 12:05:54 +0100
Subject: [Buildroot] [PATCH 20/30] pciutils: add license info
In-Reply-To: <1352804764-24026-1-git-send-email-arnout@mind.be>
References: <1352804764-24026-1-git-send-email-arnout@mind.be>
Message-ID: <1352804764-24026-20-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pciutils/pciutils.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index cd318cb..ba866a0 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -7,6 +7,9 @@
 PCIUTILS_VERSION = 3.1.10
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
 PCIUTILS_INSTALL_STAGING = YES
+PCIUTILS_LICENSE = GPLv2+
+PCIUTILS_LICENSE_FILES = COPYING
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 	PCIUTILS_ZLIB=yes
 	PCIUTILS_DEPENDENCIES += zlib
-- 
1.7.10.4
