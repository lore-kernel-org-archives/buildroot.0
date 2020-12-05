From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 14:39:04 +0100
Subject: [Buildroot] [git commit] package/perl-package-stash: bump to
 version 0.39
Message-ID: <20201205132743.C044881393@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=344ebc745b22b5f4ea368493cc35ed5e0d5fd40c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-This software is copyright (c) 2018 by Jesse Luehrs.
+This software is copyright (c) 2020 by Jesse Luehrs.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-package-stash/perl-package-stash.hash | 6 +++---
 package/perl-package-stash/perl-package-stash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-package-stash/perl-package-stash.hash b/package/perl-package-stash/perl-package-stash.hash
index be8760d2d9..0bbac515e2 100644
--- a/package/perl-package-stash/perl-package-stash.hash
+++ b/package/perl-package-stash/perl-package-stash.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    dc2d802eea2cb0b52ed9c4dd178761dd Package-Stash-0.38.tar.gz
-sha256 c58ee8844df2dda38e3bf66fdf443439aaefaef1a33940edf2055f0afd223a7f Package-Stash-0.38.tar.gz
+md5  287d80c9115c9230912aca684f8ca92e  Package-Stash-0.39.tar.gz
+sha256  9165f555112e080493ce0e9129de0886da30b2593fb353a2abd1c76b2d2621b5  Package-Stash-0.39.tar.gz
 
 # computed by scancpan
-sha256 13aab710649bae5a8bbb1ae725587ece773bf390537dba2da71247bd937d54b4 LICENSE
+sha256  810b319a6f4a53c9cbbef513da17b2f0c872accd149bb889f153f4b78cf8cbb8  LICENSE
diff --git a/package/perl-package-stash/perl-package-stash.mk b/package/perl-package-stash/perl-package-stash.mk
index b1a83bd957..bc116abca3 100644
--- a/package/perl-package-stash/perl-package-stash.mk
+++ b/package/perl-package-stash/perl-package-stash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PACKAGE_STASH_VERSION = 0.38
+PERL_PACKAGE_STASH_VERSION = 0.39
 PERL_PACKAGE_STASH_SOURCE = Package-Stash-$(PERL_PACKAGE_STASH_VERSION).tar.gz
 PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_PACKAGE_STASH_LICENSE = Artistic or GPL-1.0+
