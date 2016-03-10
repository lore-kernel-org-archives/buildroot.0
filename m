From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 10 Mar 2016 22:48:55 +0100
Subject: [Buildroot] [PATCH 3/3] ltp-testsuite: indentation cleanup
In-Reply-To: <1457646535-976-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1457646535-976-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1457646535-976-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ltp-testsuite/ltp-testsuite.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 7d455de..74bd531 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -10,8 +10,8 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
 LTP_TESTSUITE_LICENSE = GPLv2, GPLv2+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 LTP_TESTSUITE_CONF_OPTS += \
-			   --with-power-management-testsuite \
-			   --with-realtime-testsuite
+	--with-power-management-testsuite \
+	--with-realtime-testsuite
 
 # Needs libcap with file attrs which needs attr, so both required
 ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_ATTR),yy)
-- 
1.9.1
