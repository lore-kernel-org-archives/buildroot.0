From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:03:25 +0200
Subject: [Buildroot] [PATCH 12/18] perl-path-tiny: bump to version 0.104
In-Reply-To: <20170820080331.12935-1-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
Message-ID: <20170820080331.12935-12-francois.perrad@gadz.org>
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
index 259469cc1..49b6661e7 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    92ece7b2aa09f18035b0550b0118bdee Path-Tiny-0.100.tar.gz
-sha256 8b8c4c9db710470a26b356e7187eba47217fbba1fe8bd0ad72c5b2cc8f6ba10c Path-Tiny-0.100.tar.gz
+md5    17354181d9794df01be555b25114dd24 Path-Tiny-0.104.tar.gz
+sha256 c69f1dcfeb4aa004086deb9bc14c7d79f45798b947f1efbd634a3442e267aaef Path-Tiny-0.104.tar.gz
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index ed1304d4c..53e787dc1 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.100
+PERL_PATH_TINY_VERSION = 0.104
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
-- 
2.11.0
