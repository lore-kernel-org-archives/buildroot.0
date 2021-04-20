From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:23 -0500
Subject: [Buildroot] [PATCH 02/25] package/c-periphery: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:c-periphery_project:c-periphery:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:c-periphery_project:c-periphery

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/c-periphery/c-periphery.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index dcc82f19c0..722679f9f8 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -9,5 +9,6 @@ C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 C_PERIPHERY_LICENSE = MIT
 C_PERIPHERY_LICENSE_FILES = LICENSE
+C_PERIPHERY_CPE_ID_VENDOR = c-periphery_project
 
 $(eval $(cmake-package))
-- 
2.17.1
