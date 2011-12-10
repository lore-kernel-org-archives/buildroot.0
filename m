From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Dec 2011 20:38:07 +0100
Subject: [Buildroot] [git commit] proftpd: security bump to version 1.3.3g
Message-ID: <20111210222040.9560F8EBE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43ba7c1af8f89be7092516cada8e95e147f79e72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security bump version to 1.3.3g, fix for CVE-2011-4130

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....3g-fix-kernel-header-capability-version.patch} |    0
 package/proftpd/proftpd.mk                         |    3 ++-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/proftpd/proftpd-1.3.3e-fix-kernel-header-capability-version.patch b/package/proftpd/proftpd-1.3.3g-fix-kernel-header-capability-version.patch
similarity index 100%
rename from package/proftpd/proftpd-1.3.3e-fix-kernel-header-capability-version.patch
rename to package/proftpd/proftpd-1.3.3g-fix-kernel-header-capability-version.patch
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 2523dd2..5352ea7 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -3,7 +3,8 @@
 # proftpd
 #
 #############################################################
-PROFTPD_VERSION = 1.3.3e
+
+PROFTPD_VERSION = 1.3.3g
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.bz2
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source/
 
