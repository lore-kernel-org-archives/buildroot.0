From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:31 -0500
Subject: [Buildroot] [PATCH 10/25] package/libdaemon: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-10-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libdaemon_project:libdaemon:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:libdaemon_project:libdaemon

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libdaemon/libdaemon.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index a8f75108bc..47d4e80042 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -12,5 +12,6 @@ LIBDAEMON_INSTALL_STAGING = YES
 LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPTS = --disable-lynx
 LIBDAEMON_DEPENDENCIES = host-pkgconf
+LIBDAEMON_CPE_ID_VENDOR = libdaemon_project
 
 $(eval $(autotools-package))
-- 
2.17.1
