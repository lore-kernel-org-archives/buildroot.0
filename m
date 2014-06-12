From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 12 Jun 2014 08:06:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: Bump version to 1.1.3
In-Reply-To: <1402553197-6411-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402553197-6411-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402553197-6411-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/minidlna.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 78652c3..13d65d6 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.1.2
+MINIDLNA_VERSION = 1.1.3
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPLv2 BSD-3c
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
-- 
1.7.10.4
