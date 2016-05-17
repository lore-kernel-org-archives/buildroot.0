From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 May 2016 14:04:43 -0500
Subject: [Buildroot] [PATCH 4/4] fmlib: bump to SDK 1.8
In-Reply-To: <1463511883-27657-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463511883-27657-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1463511883-27657-4-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/fmlib/fmlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index a4d28d0..51f8f70 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMLIB_VERSION = fsl-sdk-v1.5-rc3
+FMLIB_VERSION = fsl-sdk-v1.8
 FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
 FMLIB_LICENSE = BSD-3c, GPLv2+
 FMLIB_LICENSE_FILES = COPYING
-- 
1.9.1
