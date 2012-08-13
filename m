From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Aug 2012 17:02:38 -0300
Subject: [Buildroot] [PATCH 4/7] smartmontools: bump to version 5.43
In-Reply-To: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344888161-10068-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/smartmontools/smartmontools.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index a6873f0..3c573f8 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,9 @@
 #
 #############################################################
 
-SMARTMONTOOLS_VERSION = 5.42
+SMARTMONTOOLS_VERSION = 5.43
 SMARTMONTOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
+SMARTMONTOOLS_LICENSE = GPLv2+
+SMARTMONTOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.8.6
