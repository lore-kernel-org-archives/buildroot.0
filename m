From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:21:58 +0100
Subject: [Buildroot] [git commit] efl/libethumb: bump to 1.7.4 and change
	download location
Message-ID: <20121230112958.1CE019A53C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad2e427004f93d9f3d3f88991eb66898f8d25347
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libethumb/libethumb.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index ba77e4c..eb098ea 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBETHUMB_VERSION = 0.1.1.65643
+LIBETHUMB_VERSION = 1.7.4
 LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
-LIBETHUMB_SITE = http://download.enlightenment.org/snapshots/2011-11-28
+LIBETHUMB_SITE = http://download.enlightenment.org/releases/
 LIBETHUMB_LICENSE = LGPLv2.1+
 LIBETHUMB_LICENSE_FILES = COPYING
 
