From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 26 Oct 2016 11:19:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/ti-sgx-km: indentation cleanup
In-Reply-To: <1477473548-16918-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1477473548-16918-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1477473548-16918-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/ti-sgx-km/ti-sgx-km.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index 58ba3f0..16d2ca8 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -31,7 +31,7 @@ TI_SGX_KM_SUBDIR = eurasia_km/eurasiacon/build/linux2/$(TI_SGX_KM_PLATFORM_NAME)
 
 define TI_SGX_KM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
-		 -C $(@D)/$(TI_SGX_KM_SUBDIR)
+		-C $(@D)/$(TI_SGX_KM_SUBDIR)
 endef
 
 define TI_SGX_KM_INSTALL_TARGET_CMDS
-- 
1.9.1
