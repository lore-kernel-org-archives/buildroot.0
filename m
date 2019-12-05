From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 21:38:24 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/perl-gdtextutil:
 add license
Message-ID: <20191205203043.D0DA788096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=717fc49ceb12c9a9e97f692edd300553fabe77fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Dustismo.LICENSE contains the license for the Dustismo_Sans.ttf font
file. The rest is licensed under the same terms as Perl as specified
in README

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3ec2bee2355a26bc862894e68020c2475daf040f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-gdtextutil/perl-gdtextutil.hash | 3 ++-
 package/perl-gdtextutil/perl-gdtextutil.mk   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/perl-gdtextutil/perl-gdtextutil.hash b/package/perl-gdtextutil/perl-gdtextutil.hash
index f0e947f63c..add0717f1d 100644
--- a/package/perl-gdtextutil/perl-gdtextutil.hash
+++ b/package/perl-gdtextutil/perl-gdtextutil.hash
@@ -2,5 +2,6 @@
 md5    941ad06eadc86b47f3a32da405665c41 GDTextUtil-0.86.tar.gz
 sha256 886ecbf85cfe94f4135ee5689c4847a9ae783ecb99e6759e12c734f2dd6116bc GDTextUtil-0.86.tar.gz
 
-# computed by scancpan
+# Hash for license files
 sha256 710484e3a1196664bbe8a5ad5d53c528e01226eb20e2885a4e1131eb6c6565cd Dustismo.LICENSE
+sha256 93ca7dd7f372c79e8ec1f849f2a418a67d195e4027c1b3e3dd8444fb30f3e97c README
diff --git a/package/perl-gdtextutil/perl-gdtextutil.mk b/package/perl-gdtextutil/perl-gdtextutil.mk
index cd1617fbbd..f91d9e9eb3 100644
--- a/package/perl-gdtextutil/perl-gdtextutil.mk
+++ b/package/perl-gdtextutil/perl-gdtextutil.mk
@@ -7,7 +7,8 @@
 PERL_GDTEXTUTIL_VERSION = 0.86
 PERL_GDTEXTUTIL_SOURCE = GDTextUtil-$(PERL_GDTEXTUTIL_VERSION).tar.gz
 PERL_GDTEXTUTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MV/MVERB
-PERL_GDTEXTUTIL_LICENSE_FILES = Dustismo.LICENSE
+PERL_GDTEXTUTIL_LICENSE = Artistic or GPL-1.0+ (perl module), GPL-2.0+ (font)
+PERL_GDTEXTUTIL_LICENSE_FILES = Dustismo.LICENSE README
 PERL_GDTEXTUTIL_DISTNAME = GDTextUtil
 
 $(eval $(perl-package))
