From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 16:01:37 +0200
Subject: [Buildroot] [git commit] proftpd: bump version
Message-ID: <20110718140226.1EF018A36C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=135f1140a1160be3ebcd21e6c6a37ffd8abcf6ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes several security-related issues.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....3e-fix-kernel-header-capability-version.patch} |    0
 package/proftpd/proftpd.mk                         |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename package/proftpd/{proftpd-1.3.3b-fix-kernel-header-capability-version.patch => proftpd-1.3.3e-fix-kernel-header-capability-version.patch} (100%)

diff --git a/package/proftpd/proftpd-1.3.3b-fix-kernel-header-capability-version.patch b/package/proftpd/proftpd-1.3.3e-fix-kernel-header-capability-version.patch
similarity index 100%
rename from package/proftpd/proftpd-1.3.3b-fix-kernel-header-capability-version.patch
rename to package/proftpd/proftpd-1.3.3e-fix-kernel-header-capability-version.patch
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 75ab930..3733cd6 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -3,7 +3,7 @@
 # proftpd
 #
 #############################################################
-PROFTPD_VERSION = 1.3.3b
+PROFTPD_VERSION = 1.3.3e
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.bz2
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source/
 
-- 
1.7.3.4
