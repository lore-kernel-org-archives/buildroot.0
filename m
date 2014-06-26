From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:32 -0300
Subject: [Buildroot] [PATCH 04/53] dbus-python: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus-python/dbus-python.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.5.5
