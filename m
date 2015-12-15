From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:03:32 +0100
Subject: [Buildroot] [git commit] bluez_utils: comma separate licenses
Message-ID: <20151215210844.800AF818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=643e1f4c58109ae8ff4be9db3efd0c4a8809a733
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez_utils/bluez_utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 6327a28..c2e8295 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -11,7 +11,7 @@ BLUEZ_UTILS_INSTALL_STAGING = YES
 BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ_UTILS_CONF_OPTS = --enable-test --enable-tools
 BLUEZ_UTILS_AUTORECONF = YES
-BLUEZ_UTILS_LICENSE = GPLv2+ LGPLv2.1+
+BLUEZ_UTILS_LICENSE = GPLv2+, LGPLv2.1+
 BLUEZ_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
 # BlueZ 3.x compatibility
