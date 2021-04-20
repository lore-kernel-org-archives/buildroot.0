From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:46 -0500
Subject: [Buildroot] [PATCH 25/25] package/sysvinit: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-25-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:sysvinit_project:sysvinit:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:sysvinit_project:sysvinit

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/sysvinit/sysvinit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 72cf313f25..1bf10deb63 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -9,6 +9,7 @@ SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
 SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
 SYSVINIT_LICENSE = GPL-2.0+
 SYSVINIT_LICENSE_FILES = COPYING
+SYSVINIT_CPE_ID_VENDOR = sysvinit_project
 
 SYSVINIT_MAKE_OPTS = SYSROOT=$(STAGING_DIR)
 
-- 
2.17.1
