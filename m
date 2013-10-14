From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon, 14 Oct 2013 14:25:05 +0200
Subject: [Buildroot] [PATCH 3/3] sysvinit: add license information
In-Reply-To: <1381753505-13119-1-git-send-email-phil@zankapfel.net>
References: <1381753505-13119-1-git-send-email-phil@zankapfel.net>
Message-ID: <1381753505-13119-2-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/sysvinit/sysvinit.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index bf05d73..131c63f 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -8,6 +8,8 @@ SYSVINIT_VERSION = 2.88
 SYSVINIT_SOURCE  = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
 SYSVINIT_PATCH   = sysvinit_$(SYSVINIT_VERSION)dsf-13.1.diff.gz
 SYSVINIT_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
+SYSVINIT_LICENSE = GPLv2+
+SYSVINIT_LICENSE_FILES = COPYING
 
 # Override Busybox implementations if Busybox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.7.10.4
