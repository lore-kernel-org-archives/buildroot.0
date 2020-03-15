From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:27:42 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/libevdev: add
 host-python dependency
Message-ID: <20200315101539.C8854846E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e285152cc39c5aedbc437224ecc322bebd691b8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes:

  checking for a Python interpreter with version >= 2.6... none
  configure: error: no suitable Python interpreter found

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 93490c25836c18dc475e4144de3282f14c4d6570)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
