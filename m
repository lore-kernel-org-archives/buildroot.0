From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:24:57 +0200
Subject: [Buildroot] [git commit] package/dbus-python: remove whitespace
Message-ID: <20150419122631.3529A7F9AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d214c295d1cf2d3d71c03cb84f96f6286e8c26c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus-python/dbus-python.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

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
