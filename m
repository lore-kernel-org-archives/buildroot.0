From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:17:46 +0200
Subject: [Buildroot] [git commit] pixman: add license informations
Message-ID: <20130512202410.61C509A164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61232f80607edb09c04124b8bf6076555668b417
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pixman/pixman.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 607f82e..c2ee035 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -5,6 +5,9 @@
 ################################################################################
 PIXMAN_VERSION = 0.28.2
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
+PIXMAN_LICENSE = MIT
+PIXMAN_LICENSE_FILES = COPYING
+
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkgconf
 # don't build gtk based demos
