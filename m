From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri,  3 Aug 2012 17:45:05 +0800
Subject: [Buildroot]  [PATCH 2/3] bwm-ng: Add license info
In-Reply-To: <1343987106-3302-1-git-send-email-keguang.zhang@gmail.com>
References: <1343987106-3302-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <1343987106-3302-2-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license info for bwm-ng.
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
-- 
1.7.1
