From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Aug 2012 12:47:46 +0200
Subject: [Buildroot] [git commit] bwm-ng: Add license info
Message-ID: <20120806104900.AF61397015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee508010f41c0037614e90c08420208a7afe93a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license info for bwm-ng.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bwm-ng/bwm-ng.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index 55ac2f1..ddc6f5b 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -7,6 +7,8 @@
 BWM_NG_VERSION = 0.6
 BWM_NG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)/
 BWM_NG_CONF_OPT = --with-procnetdev --with-diskstats
+BWM_NG_LICENSE = GPLv2
+BWM_NG_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 BWM_NG_CONF_OPT += --with-ncurses
