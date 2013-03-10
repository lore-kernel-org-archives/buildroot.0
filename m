From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 23:06:07 +0100
Subject: [Buildroot] [git commit] package/mdadm: add license information
Message-ID: <20130310220842.D16C19AFA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c2395549cbaa91e819737e30f5a82e1fbd22846
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christophe Vu-Brugier <cvubrugier@lacie.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mdadm/mdadm.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index d5d1766..e8cefda 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -7,6 +7,8 @@
 MDADM_VERSION = 3.2.6
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.bz2
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
+MDADM_LICENSE = GPLv2+
+MDADM_LICENSE_FILES = COPYING
 
 MDADM_MAKE_OPT = \
 	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(MDADM_DIR) mdadm
