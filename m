From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Apr 2021 21:20:29 +0200
Subject: [Buildroot] [PATCH 9/9] package/perl-role-tiny: bump to version
 2.002004
In-Reply-To: <20210424192029.595977-1-francois.perrad@gadz.org>
References: <20210424192029.595977-1-francois.perrad@gadz.org>
Message-ID: <20210424192029.595977-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-role-tiny/perl-role-tiny.hash | 4 ++--
 package/perl-role-tiny/perl-role-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-role-tiny/perl-role-tiny.hash b/package/perl-role-tiny/perl-role-tiny.hash
index 9de786800..33de6a53f 100644
--- a/package/perl-role-tiny/perl-role-tiny.hash
+++ b/package/perl-role-tiny/perl-role-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  065e459cdc3c6e163c6e8359baf69f45  Role-Tiny-2.002003.tar.gz
-sha256  6981e5f2d0beded157840199d678da462b22a9a3753333cab322ab6efb0fbb89  Role-Tiny-2.002003.tar.gz
+md5  9ee45591befa3d0b1094ac75d282b6ba  Role-Tiny-2.002004.tar.gz
+sha256  d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa845dcb44d9a242b45  Role-Tiny-2.002004.tar.gz
 
 # computed by scancpan
 sha256  a8a1595c2347f7d10e896809d4f3dea85ccc10ac5644b8073111233cd120b14a  LICENSE
diff --git a/package/perl-role-tiny/perl-role-tiny.mk b/package/perl-role-tiny/perl-role-tiny.mk
index 5a6477f94..64d5085fa 100644
--- a/package/perl-role-tiny/perl-role-tiny.mk
+++ b/package/perl-role-tiny/perl-role-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_ROLE_TINY_VERSION = 2.002003
+PERL_ROLE_TINY_VERSION = 2.002004
 PERL_ROLE_TINY_SOURCE = Role-Tiny-$(PERL_ROLE_TINY_VERSION).tar.gz
 PERL_ROLE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_ROLE_TINY_LICENSE = Artistic or GPL-1.0+
-- 
2.27.0
