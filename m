From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jun 2016 10:23:09 +0200
Subject: [Buildroot] [git commit] dbus-python: bump to version 1.2.4
Message-ID: <20160627082350.317ED81E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dd4537a1448da2489d36f0c479cd2a2caf60cd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-python/dbus-python.hash | 2 +-
 package/dbus-python/dbus-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-python/dbus-python.hash b/package/dbus-python/dbus-python.hash
index 94af72e..080aada 100644
--- a/package/dbus-python/dbus-python.hash
+++ b/package/dbus-python/dbus-python.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e12c6c8b2bf3a9302f75166952cbe41d6b38c3441bbc6767dbd498942316c6df	dbus-python-1.2.0.tar.gz
+sha256	e2f1d6871f74fba23652e51d10873e54f71adab0525833c19bad9e99b1b2f9cc	dbus-python-1.2.4.tar.gz
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 4079967..599d019 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_PYTHON_VERSION = 1.2.0
+DBUS_PYTHON_VERSION = 1.2.4
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT
