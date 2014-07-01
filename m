From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 17:20:27 +0200
Subject: [Buildroot] [git commit] dbus-python: add license information
Message-ID: <20140701153344.09A929CE74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8dfaf68682cbe035f89b8632f8e080e0506fd51e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-python/dbus-python.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 7c59ceb..4dd3d8c 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -7,6 +7,8 @@
 DBUS_PYTHON_VERSION = 0.83.0
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python/
 DBUS_PYTHON_INSTALL_STAGING = YES
+DBUS_PYTHON_LICENSE = MIT
+DBUS_PYTHON_LICENSE_FILES = COPYING
 
 DBUS_PYTHON_CONF_ENV = am_cv_pathless_PYTHON=python \
 		ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
