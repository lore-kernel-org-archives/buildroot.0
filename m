From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 16:29:21 +0200
Subject: [Buildroot] [PATCH 02/19] package/fmtools: bump version to 2.0.7
In-Reply-To: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429453778-4178-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429453778-4178-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fmtools/fmtools.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
index bacd73c..4b1b64f 100644
--- a/package/fmtools/fmtools.mk
+++ b/package/fmtools/fmtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMTOOLS_VERSION = 2.0.1
+FMTOOLS_VERSION = 2.0.7
 FMTOOLS_SITE = http://benpfaff.org/fmtools
 FMTOOLS_LICENSE = GPLv2+
 FMTOOLS_LICENSE_FILES = COPYING
-- 
1.7.10.4
