From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 16 Jul 2016 22:26:12 -0400
Subject: [Buildroot] [PATCH] ti-sgx-km: fix ENV typo
Message-ID: <1468722372-2365-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/ti-sgx-km/ti-sgx-km.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index d8447aa..58ba3f0 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -35,7 +35,7 @@ define TI_SGX_KM_BUILD_CMDS
 endef
 
 define TI_SGX_KM_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_EVN) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
 		DISCIMAGE=$(TARGET_DIR) \
 		kbuild_install -C $(@D)/$(TI_SGX_KM_SUBDIR)
 endef
-- 
1.9.1
