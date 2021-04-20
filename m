From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:40 -0500
Subject: [Buildroot] [PATCH 19/25] package/pugixml: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-19-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pugixml_project:pugixml:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:pugixml_project:pugixml

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/pugixml/pugixml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 5d7fc63017..a9ccb2d40b 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -9,6 +9,7 @@ PUGIXML_SITE = http://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSI
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md
 PUGIXML_INSTALL_STAGING = YES
+PUGIXML_CPE_ID_VENDOR = pugixml_project
 
 # Pugixml will automatically enable 'long long' support on C++11 compilers,
 # which means gcc 4.8+. As gcc always supports the 'long long' type,
-- 
2.17.1
