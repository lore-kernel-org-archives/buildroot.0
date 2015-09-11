From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 19:49:14 +0200
Subject: [Buildroot] [git commit] gnupg2: bump version to 2.0.29
Message-ID: <20150913100729.9BBEA81E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a33f1917dc830f315d2a723b967a9e6b93a8b43c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.hash |    4 ++--
 package/gnupg2/gnupg2.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 2a2305c..1219338 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,2 +1,2 @@
-# From http://lists.gnupg.org/pipermail/gnupg-announce/2015q2/000367.html
-sha1	9a1050f72b6c9afe2b4a0a3f2e9dca2abba8e4ef	gnupg-2.0.28.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2015-09/msg00001.html
+sha1 87eb0df18f9953675f979405a1af10ab6c5322b3  gnupg-2.0.29.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index ab3a59a..6d279fd 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.0.28
+GNUPG2_VERSION = 2.0.29
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
