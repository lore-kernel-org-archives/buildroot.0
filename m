From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:39 -0500
Subject: [Buildroot] [PATCH 18/25] package/popt: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-18-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:popt_project:popt:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:popt_project:popt

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/popt/popt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 5c4863ce40..5be35070d0 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -13,6 +13,7 @@ POPT_GETTEXTIZE = YES
 POPT_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # We're patching configure.ac
 POPT_AUTORECONF = YES
+POPT_CPE_ID_VENDOR = popt_project
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
-- 
2.17.1
