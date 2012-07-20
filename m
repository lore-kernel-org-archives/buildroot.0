From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 23:42:41 +0200
Subject: [Buildroot] [git commit] memtester: bump to version 4.3.0
Message-ID: <20120720214329.8BDC996BEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d3ec6cfe1d1c0abacce65ba2f494aae98af263e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...file-fix.patch => memtester-makefile-fix.patch} |    0
 package/memtester/memtester.mk                     |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/memtester/memtester-4.2.1-makefile-fix.patch b/package/memtester/memtester-makefile-fix.patch
similarity index 100%
rename from package/memtester/memtester-4.2.1-makefile-fix.patch
rename to package/memtester/memtester-makefile-fix.patch
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index b9c5e1d..8cca471 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -3,7 +3,7 @@
 # memtester
 #
 #############################################################
-MEMTESTER_VERSION = 4.2.1
+MEMTESTER_VERSION = 4.3.0
 MEMTESTER_SOURCE = memtester-$(MEMTESTER_VERSION).tar.gz
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions/
 
