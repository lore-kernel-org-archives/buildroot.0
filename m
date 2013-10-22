From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 15:54:55 +0200
Subject: [Buildroot] [git commit] sysvinit: add license information
Message-ID: <20131022140318.20EF19AA4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=991cf48a182105c98a8ec2d1a3c6359a2827da4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/sysvinit.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
