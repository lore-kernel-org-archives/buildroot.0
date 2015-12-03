From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu,  3 Dec 2015 21:30:56 -0200
Subject: [Buildroot] [PATCH 1/1] fakeroot: build depends on libcap
Message-ID: <1449185456-5409-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/fakeroot/fakeroot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 8bb9294..f3dc96e 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -9,5 +9,6 @@ FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
 FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
+FAKEROOT_DEPENDENCIES = host-libcap
 
 $(eval $(host-autotools-package))
-- 
1.9.1
