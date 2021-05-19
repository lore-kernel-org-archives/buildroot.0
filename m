From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:51:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/grpc: add
 GRPC_CPE_ID_VENDOR
Message-ID: <20210519192209.C3CAC88773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0c0b27d47695b528b83b0b982751ca95fd6a848
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:grpc:grpc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agrpc%3Agrpc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ea77594f3fb2bfab7fe0bb7417fdee0f3a6ccd9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grpc/grpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 27b28deff3..f7a704dcd1 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -8,6 +8,7 @@ GRPC_VERSION = 1.35.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
+GRPC_CPE_ID_VENDOR = grpc
 
 GRPC_INSTALL_STAGING = YES
 
