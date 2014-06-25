From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:39:17 +0200
Subject: [Buildroot] [git commit] kexec: add license information
Message-ID: <20140625211213.AB98F9D0C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ada18159dcb59e7a1bdff1b3a78a5369d498cfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/kexec.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 9787038..609825a 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -7,6 +7,8 @@
 KEXEC_VERSION = 2.0.7
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
+KEXEC_LICENSE = GPLv2
+KEXEC_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPT += --with-zlib
