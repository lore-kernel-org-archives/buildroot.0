From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:27:44 +0100
Subject: [Buildroot] [git commit] hostapd: correct legal info
Message-ID: <20160225213612.62C797F92A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52f845742f9a7adbb98cf06df7976828ccebaf62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hostapd is licensed under BSD-3c only and not dual licensed.

Quoting from COPYING file
 This software was previously distributed under BSD/GPL v2 dual license
 terms that allowed either of those license alternatives to be
 selected. As of February 11, 2012, the project has chosen to use only
 the BSD license option for future distribution. As such, the GPL v2
 license option is no longer used.

Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/hostapd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 88867e6..dca07c1 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -10,7 +10,7 @@ HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = host-pkgconf libnl
 HOSTAPD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
-HOSTAPD_LICENSE = GPLv2/BSD-3c
+HOSTAPD_LICENSE = BSD-3c
 HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CONFIG_SET =
 
