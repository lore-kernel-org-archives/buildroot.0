From: Chih-Min Chao <cmchao@gmail.com>
Date: Mon, 13 Sep 2010 23:12:15 +0800
Subject: [Buildroot] [PATCH 5/5] dbus : bump to 1.2.24
In-Reply-To: <1284390735-2261-1-git-send-email-cmchao@gmail.com>
References: <1284390735-2261-1-git-send-email-cmchao@gmail.com>
Message-ID: <1284390735-2261-6-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/dbus/dbus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index e93738e..c9fb339 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -3,7 +3,7 @@
 # dbus
 #
 #############################################################
-DBUS_VERSION = 1.2.16
+DBUS_VERSION = 1.2.24
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_LIBTOOL_PATCH = NO
-- 
1.7.0.4
