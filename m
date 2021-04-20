From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:37 -0500
Subject: [Buildroot] [PATCH 16/25] package/parted: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-16-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:parted_project:parted:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:parted_project:parted

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/parted/parted.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index c3ab3ceb4b..66940fc516 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -11,6 +11,7 @@ PARTED_DEPENDENCIES = host-pkgconf util-linux
 PARTED_INSTALL_STAGING = YES
 PARTED_LICENSE = GPL-3.0+
 PARTED_LICENSE_FILES = COPYING
+PARTED_CPE_ID_VENDOR = parted_project
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 PARTED_DEPENDENCIES += readline
-- 
2.17.1
