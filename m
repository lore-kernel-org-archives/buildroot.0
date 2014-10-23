From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:34 +0200
Subject: [Buildroot] [PATCH 08/11] package/fakeroot: bump to 1.18.4,
	update snapshot.debian.org date
In-Reply-To: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
References: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
Message-ID: <1414075717-7333-9-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/fakeroot/fakeroot.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 2f26b68..3f1c803 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.18.2
+FAKEROOT_VERSION = 1.18.4
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
-FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakeroot
+FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/f/fakeroot
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
 
-- 
1.7.10.4
