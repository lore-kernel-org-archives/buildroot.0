From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:33 +0200
Subject: [Buildroot] [PATCH 07/11] package/lockdev: add Debian patch,
	update snapshot.debian.org date
In-Reply-To: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
References: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
Message-ID: <1414075717-7333-8-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/lockdev/lockdev.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.7.10.4
