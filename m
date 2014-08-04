From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 21:38:27 +0200
Subject: [Buildroot] [git commit] exim: security bump to version 4.83
Message-ID: <20140804193835.6E52D9D3A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80cfab8fdefa20cef32e5e591ebf9bc47d1d7bc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-2972 - prevent double expansion in math comparison
functions (can expand unsanitized data).
Also rename patches according to patch naming policy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...exim-0001-Build-buildconfig-for-the-host.patch} |    0
 ...-t-make-backup-copies-of-installed-files.patch} |    0
 ...p-version-check-and-symlink-installation.patch} |    0
 package/exim/exim.mk                               |    2 +-
 4 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/exim/exim-Build-buildconfig-for-the-host.patch b/package/exim/exim-0001-Build-buildconfig-for-the-host.patch
similarity index 100%
rename from package/exim/exim-Build-buildconfig-for-the-host.patch
rename to package/exim/exim-0001-Build-buildconfig-for-the-host.patch
diff --git a/package/exim/exim-Don-t-make-backup-copies-of-installed-files.patch b/package/exim/exim-0002-Don-t-make-backup-copies-of-installed-files.patch
similarity index 100%
rename from package/exim/exim-Don-t-make-backup-copies-of-installed-files.patch
rename to package/exim/exim-0002-Don-t-make-backup-copies-of-installed-files.patch
diff --git a/package/exim/exim-Skip-version-check-and-symlink-installation.patch b/package/exim/exim-0003-Skip-version-check-and-symlink-installation.patch
similarity index 100%
rename from package/exim/exim-Skip-version-check-and-symlink-installation.patch
rename to package/exim/exim-0003-Skip-version-check-and-symlink-installation.patch
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 8be8e75..845c5f8 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.82.1
+EXIM_VERSION = 4.83
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
