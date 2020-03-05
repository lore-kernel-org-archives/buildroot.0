From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:03:50 +0100
Subject: [Buildroot] [git commit] package/libevdev: add host-python
 dependency
Message-ID: <20200305215141.8DEFF8F4E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93490c25836c18dc475e4144de3282f14c4d6570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  checking for a Python interpreter with version >= 2.6... none
  configure: error: no suitable Python interpreter found

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libevdev/libevdev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 0b5a526bab..8b243be74e 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -14,7 +14,7 @@ LIBEVDEV_LICENSE_FILES = COPYING
 LIBEVDEV_AUTORECONF = YES
 
 # Uses PKG_CHECK_MODULES() in configure.ac
-LIBEVDEV_DEPENDENCIES = host-pkgconf
+LIBEVDEV_DEPENDENCIES = host-pkgconf host-python
 
 LIBEVDEV_INSTALL_STAGING = YES
 
