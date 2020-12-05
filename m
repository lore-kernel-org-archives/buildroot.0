From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  5 Dec 2020 07:44:55 +0100
Subject: [Buildroot] [PATCH 08/10] package/perl-package-stash: bump to
 version 0.39
In-Reply-To: <20201205064457.606737-1-francois.perrad@gadz.org>
References: <20201205064457.606737-1-francois.perrad@gadz.org>
Message-ID: <20201205064457.606737-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff LICENSE:
-This software is copyright (c) 2018 by Jesse Luehrs.
+This software is copyright (c) 2020 by Jesse Luehrs.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-package-stash/perl-package-stash.hash | 6 +++---
 package/perl-package-stash/perl-package-stash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-package-stash/perl-package-stash.hash b/package/perl-package-stash/perl-package-stash.hash
index be8760d2d..0bbac515e 100644
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
index b1a83bd95..bc116abca 100644
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
-- 
2.27.0
