From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Apr 2017 22:17:35 +0200
Subject: [Buildroot] [PATCH 2/4] package/freeswitch: install to staging
In-Reply-To: <20170430201737.12821-1-bernd.kuhls@t-online.de>
References: <20170430201737.12821-1-bernd.kuhls@t-online.de>
Message-ID: <20170430201737.12821-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming package freeswitch_mod_bcg729.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e6c1e8c93..215d0b974 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -7,6 +7,8 @@
 FREESWITCH_VERSION = 1.6.17
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
+# needed for external modules
+FREESWITCH_INSTALL_STAGING = YES
 FREESWITCH_LICENSE = MPL-1.1, \
 	GPL-3.0+ with font exception (fonts), \
 	Apache-2.0 (apr, apr-util), \
-- 
2.11.0
