From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:11:14 -0300
Subject: [Buildroot] [PATCH 35/45] fmlib: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-36-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fmlib/fmlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 828fefe..978810b 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -6,7 +6,7 @@
 
 FMLIB_VERSION = fsl-sdk-v1.5-rc3
 FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
-FMLIB_LICENSE = BSD-3c GPLv2+
+FMLIB_LICENSE = BSD-3c, GPLv2+
 FMLIB_LICENSE_FILES = COPYING
 FMLIB_DEPENDENCIES = linux
 FMLIB_INSTALL_STAGING = YES
-- 
2.4.10
