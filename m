From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:26:12 +0200
Subject: [Buildroot] [git commit] package/lockdev: add Debian patch,
	update snapshot.debian.org date
Message-ID: <20141025095905.7574AB13C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=558e3d4eff51e8a3464558f41d4aaa42808cf116
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lockdev/lockdev.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index d90009a..21755e0 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -6,7 +6,8 @@
 
 LOCKDEV_VERSION = 1.0.3
 LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
-LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20130508T154517Z/pool/main/l/lockdev
+LOCKDEV_PATCH = lockdev_$(LOCKDEV_VERSION)-1.6.diff.gz
+LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev
 LOCKDEV_LICENSE = LGPLv2.1
 LOCKDEV_LICENSE_FILES = LICENSE
 LOCKDEV_INSTALL_STAGING = YES
