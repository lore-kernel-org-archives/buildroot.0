From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jan 2021 20:25:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/libiec61850: add
 LIBIEC61850_CPE_ID_VENDOR
In-Reply-To: <20210126192536.2183792-1-fontaine.fabrice@gmail.com>
References: <20210126192536.2183792-1-fontaine.fabrice@gmail.com>
Message-ID: <20210126192536.2183792-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:mz-automation:libiec61850 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amz-automation%3Alibiec61850

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiec61850/libiec61850.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index c102feeac1..4f82451eb8 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -9,6 +9,7 @@ LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSIO
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
 LIBIEC61850_LICENSE_FILES = COPYING
+LIBIEC61850_CPE_ID_VENDOR = mz-automation
 LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
 
 # 0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
-- 
2.29.2
