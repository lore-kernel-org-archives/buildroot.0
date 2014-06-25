From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 23:03:41 +0200
Subject: [Buildroot] [git commit] nasm: add license information
Message-ID: <20140625211214.1AE789D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc72c48c5c034c17b3f3b5f9caac8e70bbb51d7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nasm/nasm.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 18efa4a..b9077eb 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -5,8 +5,10 @@
 ################################################################################
 
 NASM_VERSION = 2.11.02
-NASM_SOURCE  = nasm-$(NASM_VERSION).tar.xz
-NASM_SITE    = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
+NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
+NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
+NASM_LICENSE = BSD-2c
+NASM_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
