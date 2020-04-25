From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 14:48:15 +0200
Subject: [Buildroot] [git commit] package/perl-data-uuid: bump to version
 1.226
Message-ID: <20200425123632.A7FC68FF89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08cab922e90443c640eb818543a5cb94ce886021
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-data-uuid/perl-data-uuid.hash | 6 +++---
 package/perl-data-uuid/perl-data-uuid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-data-uuid/perl-data-uuid.hash b/package/perl-data-uuid/perl-data-uuid.hash
index 280567177f..b2c8629605 100644
--- a/package/perl-data-uuid/perl-data-uuid.hash
+++ b/package/perl-data-uuid/perl-data-uuid.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    71510bbcce760c394591fca83a9b5e6d Data-UUID-1.224.tar.gz
-sha256 c958c17502bbef5eccf40c040874895747f7f9b9f9e5192c18688370981bf47c Data-UUID-1.224.tar.gz
+md5  13468e0fb65a0b5ce27b8628cb2f0109  Data-UUID-1.226.tar.gz
+sha256  093d57ffa0d411a94bafafae495697db26f5c9d0277198fe3f7cf2be22996453  Data-UUID-1.226.tar.gz
 
 # computed by scancpan
-sha256 0560c8eea8e1fb8173faa6c2e9b7e9f8728b8ae8250a814709a53c30b778d5fb LICENSE
+sha256  0560c8eea8e1fb8173faa6c2e9b7e9f8728b8ae8250a814709a53c30b778d5fb  LICENSE
diff --git a/package/perl-data-uuid/perl-data-uuid.mk b/package/perl-data-uuid/perl-data-uuid.mk
index 00dccdb7e6..93060964bb 100644
--- a/package/perl-data-uuid/perl-data-uuid.mk
+++ b/package/perl-data-uuid/perl-data-uuid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATA_UUID_VERSION = 1.224
+PERL_DATA_UUID_VERSION = 1.226
 PERL_DATA_UUID_SOURCE = Data-UUID-$(PERL_DATA_UUID_VERSION).tar.gz
 PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 # The license is documented at
