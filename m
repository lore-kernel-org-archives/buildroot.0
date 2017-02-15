From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 22:48:25 +0100
Subject: [Buildroot] [git commit] tcping: fix upstream location
Message-ID: <20170215214907.94E8C8167F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd6893adad3693cd3440d0ced10e67b296a08c47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream site is no longer available from http://www.linuxco.de,
but only from http://linuxco.de.

Fixes:

  http://autobuild.buildroot.net/results/03caf8403c31e2424c338de4df636dd900408b14/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcping/Config.in | 2 +-
 package/tcping/tcping.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcping/Config.in b/package/tcping/Config.in
index 6677b58..e72df09 100644
--- a/package/tcping/Config.in
+++ b/package/tcping/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_TCPING
 	  desired port is reachable and then start connection
 	  establishment.
 
-	  http://www.linuxco.de/tcping/tcping.html
+	  http://linuxco.de/tcping/tcping.html
diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
index 4633b98..f5919bb 100644
--- a/package/tcping/tcping.mk
+++ b/package/tcping/tcping.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCPING_VERSION = 1.3.5
-TCPING_SITE = http://www.linuxco.de/tcping
+TCPING_SITE = http://linuxco.de/tcping
 TCPING_LICENSE = GPLv3+
 TCPING_LICENSE_FILES = LICENSE
 
