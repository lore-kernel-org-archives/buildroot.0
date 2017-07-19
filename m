From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 22:53:26 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] iproute2: correct license
Message-ID: <20170719204938.5898A81EC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=786d15a2b4eaa219c7a38098177e6943d39ae979
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Source files license headers include the GPL "or ... any later version" language.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit b1b962274bb363eeba492d3a3f4fc1ff3ea252c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iproute2/iproute2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6ecfc09..f3e6eb2 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -9,7 +9,7 @@ IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBMNL),libmnl)
-IPROUTE2_LICENSE = GPL-2.0
+IPROUTE2_LICENSE = GPL-2.0+
 IPROUTE2_LICENSE_FILES = COPYING
 
 # If both iproute2 and busybox are selected, make certain we win
