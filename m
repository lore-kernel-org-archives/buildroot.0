From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:28 -0500
Subject: [Buildroot] [PATCH 07/25] package/iputils: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-7-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:iputils_project:iputils:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:iputils_project:iputils

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/iputils/iputils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 1ee64dabe4..715779a633 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -15,6 +15,7 @@ IPUTILS_VERSION = 20210202
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
+IPUTILS_CPE_ID_VENDOR = iputils_project
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # Selectively build binaries
-- 
2.17.1
