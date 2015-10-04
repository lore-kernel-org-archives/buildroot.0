From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:27:42 +0200
Subject: [Buildroot] [git commit] mpdecimal: use official upstream site
Message-ID: <20151004162750.A9FF081D5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aebb952a464f138116fd72618c99cafe739d3d44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The official upstream site is available again, so let's switch to
using it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpdecimal/mpdecimal.hash |    4 ++--
 package/mpdecimal/mpdecimal.mk   |    6 +-----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
index 249d56c..bc443d1 100644
--- a/package/mpdecimal/mpdecimal.hash
+++ b/package/mpdecimal/mpdecimal.hash
@@ -1,2 +1,2 @@
-# From http://code.activestate.com/lists/python-dev/132315/
-sha256 da74d3cfab559971a4fbd4fb506e1b4498636eb77d0fd09e44f8e546d18ac068 mpdecimal_2.4.1.orig.tar.gz
+# From http://www.bytereef.org/mpdecimal/download.html
+sha256 da74d3cfab559971a4fbd4fb506e1b4498636eb77d0fd09e44f8e546d18ac068 mpdecimal-2.4.1.tar.gz
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index 07a7564..2c8cc3c 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -4,12 +4,8 @@
 #
 ################################################################################
 
-# Official site currently down
-# MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
-
-MPDECIMAL_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
+MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
 MPDECIMAL_VERSION = 2.4.1
-MPDECIMAL_SOURCE = mpdecimal_$(MPDECIMAL_VERSION).orig.tar.gz
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2c
 MPDECIMAL_LICENSE_FILES = LICENSE.txt
