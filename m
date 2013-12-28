From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Dec 2013 15:58:16 +0100
Subject: [Buildroot] [git commit] libevdev: fix minor typo
Message-ID: <20131228145826.2E8159B967@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=360b09cb01281582c649ebe166e7ba3e27966e13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevdev/libevdev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 693da24..3a02230 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -13,7 +13,7 @@ LIBEVDEV_LICENSE_FILES = COPYING
 LIBEVDEV_DEPENDENCIES = host-pkgconf
 
 # Needs Python to generate a header file
-# We can't rely on the system pPython, since it may be too old
+# We can't rely on the system Python, since it may be too old
 # (missing argparse in python 2.6)
 LIBEVDEV_DEPENDENCIES += host-python
 
