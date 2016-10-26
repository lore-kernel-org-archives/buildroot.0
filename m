From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 12:23:35 +0200
Subject: [Buildroot] [git commit] package/ti-sgx-km: indentation cleanup
Message-ID: <20161026102338.9FC947FB23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dd0b2beace34a4f56471362a2b5a682699ec443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-sgx-km/ti-sgx-km.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index 58ba3f0..48c8a6d 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -31,7 +31,7 @@ TI_SGX_KM_SUBDIR = eurasia_km/eurasiacon/build/linux2/$(TI_SGX_KM_PLATFORM_NAME)
 
 define TI_SGX_KM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
-		 -C $(@D)/$(TI_SGX_KM_SUBDIR)
+		-C $(@D)/$(TI_SGX_KM_SUBDIR)
 endef
 
 define TI_SGX_KM_INSTALL_TARGET_CMDS
