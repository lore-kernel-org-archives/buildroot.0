From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:15:32 +0200
Subject: [Buildroot] [git commit] package/autoconf-archive: bump to version
	v2015.02.24
Message-ID: <20150407201538.9850B819E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fa45b06d20b643ad606c9befa7e5734d867e900
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the AX_CXX_COMPILE_STDCXX_11 macro which was broken in the
previous release.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autoconf-archive/autoconf-archive.hash |    2 +-
 package/autoconf-archive/autoconf-archive.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index 9f975d5..c310f5a 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 dfd460d23a9690322dee29a355ea285b5774f37383d3741cf77a4ad6a11a7e81  autoconf-archive-2015.02.04.tar.xz
+sha256 69715bdd078f552ca85e498a94543e11cb8bcdf0359e659b84d84d19372b0dc5  autoconf-archive-2015.02.24.tar.xz
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 4479348..bd3b0c8 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2015.02.04
+AUTOCONF_ARCHIVE_VERSION = 2015.02.24
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPLv3+ with exception
