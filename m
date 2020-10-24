From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:26:20 +0200
Subject: [Buildroot] [git commit] package/perl-file-sharedir: bump to
 version 0.118
Message-ID: <20201024201639.8799882872@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=324f90f10f2e8cec1e5c5e88919fb7aed7113a6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-file-sharedir/perl-file-sharedir.hash | 6 +++---
 package/perl-file-sharedir/perl-file-sharedir.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-file-sharedir/perl-file-sharedir.hash b/package/perl-file-sharedir/perl-file-sharedir.hash
index e0a4966553..413678d6ae 100644
--- a/package/perl-file-sharedir/perl-file-sharedir.hash
+++ b/package/perl-file-sharedir/perl-file-sharedir.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    f2a0eee9f04c93753dd56437175e5bda File-ShareDir-1.116.tar.gz
-sha256 59d90bfdf98c4656ff4173e62954ea8cf0de66565e35d108ecd7050596cb8328 File-ShareDir-1.116.tar.gz
+md5  0084f730f4e3d4d89703d92b3ea82f54  File-ShareDir-1.118.tar.gz
+sha256  3bb2a20ba35df958dc0a4f2306fc05d903d8b8c4de3c8beefce17739d281c958  File-ShareDir-1.118.tar.gz
 
 # computed by scancpan
-sha256 db57983ce0a3bce54900b5a3a3a69e9a593e7b07d0f58dd9f87ac9b016ff4a6b LICENSE
+sha256  db57983ce0a3bce54900b5a3a3a69e9a593e7b07d0f58dd9f87ac9b016ff4a6b  LICENSE
diff --git a/package/perl-file-sharedir/perl-file-sharedir.mk b/package/perl-file-sharedir/perl-file-sharedir.mk
index d907f3b066..0121b5634f 100644
--- a/package/perl-file-sharedir/perl-file-sharedir.mk
+++ b/package/perl-file-sharedir/perl-file-sharedir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_SHAREDIR_VERSION = 1.116
+PERL_FILE_SHAREDIR_VERSION = 1.118
 PERL_FILE_SHAREDIR_SOURCE = File-ShareDir-$(PERL_FILE_SHAREDIR_VERSION).tar.gz
 PERL_FILE_SHAREDIR_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
 PERL_FILE_SHAREDIR_DEPENDENCIES = host-perl-file-sharedir-install
