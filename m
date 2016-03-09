From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 23:00:14 +0100
Subject: [Buildroot] [git commit] nvidia-driver: indentation cleanup
Message-ID: <20160309220856.965C97F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=446d56d783fa08bd883e5cd4d86d5ac578542d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nvidia-driver/nvidia-driver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 7eef73b..7e67020 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -144,7 +144,7 @@ endif # BR2_PACKAGE_NVIDIA_DRIVER_MODULE == y
 # no-version symlink, so we can link to them at build time.
 define NVIDIA_DRIVER_INSTALL_LIBS
 	for libpath in $(addsuffix .so.$(NVIDIA_DRIVER_VERSION),$(NVIDIA_DRIVER_LIBS)) \
-	           $(NVIDIA_DRIVER_LIBS_NO_VERSION); \
+		$(NVIDIA_DRIVER_LIBS_NO_VERSION); \
 	do \
 		libname="$${libpath##*/}"; \
 		$(INSTALL) -D -m 0644 $(@D)/$${libpath} $(1)/usr/lib/$${libname}; \
