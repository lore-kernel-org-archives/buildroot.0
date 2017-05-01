From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  1 May 2017 06:48:00 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/freeswitch: install to staging
In-Reply-To: <20170501044802.10394-1-bernd.kuhls@t-online.de>
References: <20170501044802.10394-1-bernd.kuhls@t-online.de>
Message-ID: <20170501044802.10394-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming package freeswitch-mod-bcg729.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

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
