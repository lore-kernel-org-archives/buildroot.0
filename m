From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:08:10 +0200
Subject: [Buildroot] [git commit] package/usbredir: bump version to 0.8.0
Message-ID: <20190930210314.7F1FF83D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8df3205e428f106cff48b5478fabc36eb91aabaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hashes.

Changelog:
https://gitlab.freedesktop.org/spice/usbredir/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/usbredir/usbredir.hash | 4 +++-
 package/usbredir/usbredir.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
index 9ba11771b4..485315d28c 100644
--- a/package/usbredir/usbredir.hash
+++ b/package/usbredir/usbredir.hash
@@ -1,2 +1,4 @@
 # locally computed hash
-sha256 407e9e27a1369f01264d5501ffbe88935ddd7d5de675f5835db05dc9c9ac56f3 usbredir-0.7.1.tar.bz2
+sha256 87bc9c5a81c982517a1bec70dc8d22e15ae197847643d58f20c0ced3c38c5e00  usbredir-0.8.0.tar.bz2
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LIB
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 02cd47cfba..229a9a5618 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBREDIR_VERSION = 0.7.1
+USBREDIR_VERSION = 0.8.0
 USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.bz2
 USBREDIR_SITE = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE = LGPL-2.1+ (libraries)
