From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:29:34 +0200
Subject: [Buildroot] [git commit] gzip: bump version to 1.8
Message-ID: <20160427202940.5472E81EAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb8d139b89c46221caf702c4aeb7ccff071dad4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gzip/gzip.hash | 2 +-
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 755c450..466f846 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fb31c57e7ce7703596ef57329be7cc5c5fd741b4a0f659fea7ee6a54706b41ab  gzip-1.7.tar.xz
+sha256 ff1767ec444f71e5daf8972f6f8bf68cfcca1d2f76c248eb18e8741fc91dbbd3  gzip-1.8.tar.xz
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index b5dc361..6dc910e 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.7
+GZIP_VERSION = 1.8
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
