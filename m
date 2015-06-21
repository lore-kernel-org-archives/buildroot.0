From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:47:57 +0200
Subject: [Buildroot] [git commit] package/gpm: change archive to lzma
Message-ID: <20150621074842.3BD217FFD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a500e6af79c9c899f8839cbc00479d664e75478
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpm/gpm.hash |    2 +-
 package/gpm/gpm.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gpm/gpm.hash b/package/gpm/gpm.hash
index 1f8994b..7bbc43d 100644
--- a/package/gpm/gpm.hash
+++ b/package/gpm/gpm.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  f011b7dc7afb824e0a017b89b7300514e772853ece7fc4ee640310889411a48d  gpm-1.20.7.tar.bz2
+sha256  a955053b36556ffa7c628ce18fd6de7d625966573fa412fb08869533d8f7385c  gpm-1.20.7.tar.lzma
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index dee6208..6d3b5d2 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GPM_VERSION = 1.20.7
-GPM_SOURCE = gpm-$(GPM_VERSION).tar.bz2
+GPM_SOURCE = gpm-$(GPM_VERSION).tar.lzma
 GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives
 GPM_LICENSE = GPLv2+
 GPM_LICENSE_FILES = COPYING
