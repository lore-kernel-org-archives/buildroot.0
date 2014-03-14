From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Fri, 14 Mar 2014 21:51:07 +0100
Subject: [Buildroot] [PATCH 2/2] minidlna: bump version to 1.1.2
In-Reply-To: <1394830267-7835-1-git-send-email-berndkuhls@hotmail.com>
References: <1394830267-7835-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP1684EBD570A53B55F66873D9700@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/minidlna/minidlna.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index ea6a3fc..e1e2f3d 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.1.1
+MINIDLNA_VERSION = 1.1.2
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPLv2 BSD-3c
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
-- 
1.7.10.4
