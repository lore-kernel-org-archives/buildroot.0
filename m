From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Mar 2020 08:09:54 +0100
Subject: [Buildroot] [PATCH 08/10] package/perl-path-tiny: bump to version
 0.112
In-Reply-To: <20200311070956.6346-1-francois.perrad@gadz.org>
References: <20200311070956.6346-1-francois.perrad@gadz.org>
Message-ID: <20200311070956.6346-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-path-tiny/perl-path-tiny.hash | 4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index 954843a0a..17f7f42f8 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    da6316a7b9e4fd747cf98c11be95f630 Path-Tiny-0.110.tar.gz
-sha256 a849dc0777315899689d0b351e815d90eaa636a01ed1d5e6de99a368529b5cfa Path-Tiny-0.110.tar.gz
+md5    bf2a021d653d7252a39c0d31b41a7c6e Path-Tiny-0.112.tar.gz
+sha256 813df2d140c65f795daefd8eca18e61194ecac7050c5406a069db86dea31cc3a Path-Tiny-0.112.tar.gz
 
 # computed by scancpan
 sha256 a999b03d2b80e5c7f987289ac835fa2d88cafa9f0df24adf8a1fd21e175acd79 LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index b2748834d..7e82af4c2 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.110
+PERL_PATH_TINY_VERSION = 0.112
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
-- 
2.20.1
