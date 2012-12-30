From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:21:56 +0100
Subject: [Buildroot] [git commit] efl/libeet: bump to version 1.7.4
Message-ID: <20121230112955.7585F9A53C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5d3241f3bb620f7479e30c12bcc632734663792
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libeet/libeet.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index ccb3501..a5a1ce1 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEET_VERSION = 1.5.0
+LIBEET_VERSION = 1.7.4
 LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
 LIBEET_SITE = http://download.enlightenment.org/releases/
 LIBEET_LICENSE = BSD-2c
