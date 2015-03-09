From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  9 Mar 2015 16:09:33 -0500
Subject: [Buildroot] [PATCH 1/1] ustr: fix license name
Message-ID: <1425935373-43108-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/ustr/ustr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index ac1fa05..c2a819f 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -8,7 +8,7 @@ USTR_VERSION = 1.0.4
 USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
 USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)/
 USTR_LICENSE = BSD-2c MIT LGPLv2+
-USTR_LICENSE_FILES = LICENCE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
+USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
 
 USTR_INSTALL_STAGING = YES
 
-- 
1.9.1
