From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:35 -0500
Subject: [Buildroot] [PATCH 14/25] package/make: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-14-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:make:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:make

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/make/make.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/make/make.mk b/package/make/make.mk
index 10082353a2..fa87c17571 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -12,6 +12,7 @@ MAKE_LICENSE = GPL-3.0+
 MAKE_LICENSE_FILES = COPYING
 # Patching configure.ac
 MAKE_AUTORECONF = YES
+MAKE_CPE_ID_VENDOR = gnu
 
 MAKE_CONF_OPTS = --without-guile
 
-- 
2.17.1
