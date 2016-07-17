From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:54:05 +0200
Subject: [Buildroot] [git commit] ti-sgx-km: fix ENV typo
Message-ID: <20160717125431.405CF81DFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8419994608f30aa6744a2074453bb4ac4fe75c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
