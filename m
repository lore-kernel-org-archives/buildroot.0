From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 12:00:10 +0200
Subject: [Buildroot] [git commit] package/skalibs: bump version to 2.9.2.1
Message-ID: <20200412094620.9D5378E589@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=149e604057e496e9b35588798e3bd32bee102e2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to copyright year bump:
http://git.skarnet.org/cgi-bin/cgit.cgi/skalibs/commit/?id=3f090bb2fe66f9fd79c75344fa7f03a76ea67e00

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/skalibs/skalibs.hash | 4 ++--
 package/skalibs/skalibs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index bb5a60212f..6736dd8440 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 d3b204afc462b9659e0c16f6df1c796e7612534f537eec053529f67ddcd086a5  skalibs-2.9.1.0.tar.gz
-sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
+sha256 250b99b53dd413172db944b31c1b930aa145ac79fe6c5d7e6869ef804228c539  skalibs-2.9.2.1.tar.gz
+sha256 5443ac67e8d74ac614ced7bc64211ce90ccedb7778a68bfe9e68a8b234c9503e  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 8b995f7961..1c73f26fe7 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.9.1.0
+SKALIBS_VERSION = 2.9.2.1
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
