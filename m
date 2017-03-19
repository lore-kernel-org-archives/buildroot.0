From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun, 19 Mar 2017 10:59:51 +0100
Subject: [Buildroot] [PATCH 4/5] package/uclibc-ng-test: indentation cleanup
In-Reply-To: <1489917592-12454-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1489917592-12454-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1489917592-12454-4-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/uclibc-ng-test/uclibc-ng-test.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 610ca01..0e2b584 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -48,7 +48,7 @@ define UCLIBC_NG_TEST_BUILD_CMDS
 endef
 
 define UCLIBC_NG_TEST_INSTALL_TARGET_CMDS
-        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
