From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 20 Jan 2017 10:29:55 +0100
Subject: [Buildroot] [PATCH 02/12] perl-path-tiny: bump to version 0.100
In-Reply-To: <1484904605-11239-1-git-send-email-francois.perrad@gadz.org>
References: <1484904605-11239-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1484904605-11239-2-git-send-email-francois.perrad@gadz.org>
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
index a62c165..259469c 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    840696b295230682c727297c87fe42d6 Path-Tiny-0.072.tar.gz
-sha256 d7507c7822d4f7f60a5329d26c8afce31022cd92d02b011e367cc6a1eeae6981 Path-Tiny-0.072.tar.gz
+md5    92ece7b2aa09f18035b0550b0118bdee Path-Tiny-0.100.tar.gz
+sha256 8b8c4c9db710470a26b356e7187eba47217fbba1fe8bd0ad72c5b2cc8f6ba10c Path-Tiny-0.100.tar.gz
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 0af84fd..ed1304d 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.072
+PERL_PATH_TINY_VERSION = 0.100
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
-- 
2.7.4
