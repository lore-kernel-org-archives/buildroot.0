From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 14:01:30 +0200
Subject: [Buildroot] [PATCH 2/5] package/dbus-python: remove whitespace
In-Reply-To: <1429444893-13874-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429444893-13874-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429444893-13874-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dbus-python/dbus-python.mk |    2 --
 1 file changed, 2 deletions(-)

diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 1637406..9bda018 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -28,6 +28,4 @@ DBUS_PYTHON_CONF_ENV += \
 	PYTHON_LIBS="$(shell $(STAGING_DIR)/usr/bin/python3-config --ldflags)"
 endif
 
-
-
 $(eval $(autotools-package))
-- 
1.7.10.4
