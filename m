From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:42:09 +0100
Subject: [Buildroot] [PATCH 16/20] efl/libethumb: bump to 1.7.4 and change
	download location
In-Reply-To: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <af8c8f89adb7e277f787b1d9c414c51326c06e54.1356723702.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libethumb/libethumb.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
 
-- 
1.7.9.5
