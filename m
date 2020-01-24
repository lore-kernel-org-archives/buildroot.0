From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jan 2020 20:11:34 +0100
Subject: [Buildroot] [git commit] package/perl-path-tiny: bump to version
 0.110
Message-ID: <20200124190621.80D3083968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b9d6a880635d60bc7797befb1edfad66e68cfe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-path-tiny/perl-path-tiny.hash | 4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index 2ad8a6414c..954843a0a5 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1a7fbdccc4585074ce4419b7bec0966c Path-Tiny-0.108.tar.gz
-sha256 3c49482be2b3eb7ddd7e73a5b90cff648393f5d5de334ff126ce7a3632723ff5 Path-Tiny-0.108.tar.gz
+md5    da6316a7b9e4fd747cf98c11be95f630 Path-Tiny-0.110.tar.gz
+sha256 a849dc0777315899689d0b351e815d90eaa636a01ed1d5e6de99a368529b5cfa Path-Tiny-0.110.tar.gz
 
 # computed by scancpan
 sha256 a999b03d2b80e5c7f987289ac835fa2d88cafa9f0df24adf8a1fd21e175acd79 LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 5d654efee3..b2748834df 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.108
+PERL_PATH_TINY_VERSION = 0.110
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
