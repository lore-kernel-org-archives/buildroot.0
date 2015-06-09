From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 21:38:07 +0200
Subject: [Buildroot] [git commit] mc: change tarball compression to xz
Message-ID: <20150609193832.E50A08185E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c281673065ea8983b714e8845d942b3d2b3b8698
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash file is updated accordingly.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mc/mc.hash |    2 +-
 package/mc/mc.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 588bbaa..7ae1c3b 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,2 +1,2 @@
 # Hash from http://ftp.midnight-commander.org/mc-4.8.14.sha256:
-sha256  61fd0fd2280c3d09d7e0aec8ab001fc89dad8e4fd9941f386414667b55152ec5  mc-4.8.14.tar.bz2
+sha256  6b1f74efbdf394bfab084f4d2ea2e72173de5f12cd42be2533ca2c3b72edb8e6  mc-4.8.14.tar.xz
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index f96d396..742b8e8 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MC_VERSION = 4.8.14
-MC_SOURCE = mc-$(MC_VERSION).tar.bz2
+MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE =  GPLv3+
 MC_LICENSE_FILES = COPYING
