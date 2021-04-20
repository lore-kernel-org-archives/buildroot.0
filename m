From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:34 -0500
Subject: [Buildroot] [PATCH 13/25] package/libtool: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-13-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:libtool:2.4.6:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:libtool:2.4.6

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libtool/libtool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 10af8cf715..6342e70a39 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -7,6 +7,7 @@
 LIBTOOL_VERSION = 2.4.6
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
+LIBTOOL_CPE_ID_VENDOR = gnu
 
 # For the target variant, we only want to build/install libltdl
 LIBTOOL_SUBDIR = libltdl
-- 
2.17.1
