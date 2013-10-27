From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 11:06:31 +0100
Subject: [Buildroot] [git commit] perl-cross: bump to version 0.8.3
Message-ID: <20131027100719.4A0879BBEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a06f31fb6488e8b02b409d25ee6550e39c42c487
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl-fix-Module-Build.patch |    2 +-
 package/perl/perl.mk                     |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl-fix-Module-Build.patch b/package/perl/perl-fix-Module-Build.patch
index 26b15e4..9101c11 100644
--- a/package/perl/perl-fix-Module-Build.patch
+++ b/package/perl/perl-fix-Module-Build.patch
@@ -5,7 +5,7 @@ Index: b/cpan/Module-Build/lib/Module/Build/Base.pm
 ===================================================================
 --- a/cpan/Module-Build/lib/Module/Build/Base.pm
 +++ b/cpan/Module-Build/lib/Module/Build/Base.pm
-@@ -456,7 +456,7 @@
+@@ -460,7 +460,7 @@
    my $proto = shift;
    my $c     = ref($proto) ? $proto->{config} : 'Module::Build::Config';
  
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index ac85ed9..8fb4fdc 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,8 +12,8 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.8
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_CROSS_VERSION = 0.8.3
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_CROSS_SITE    = http://download.berlios.de/perlcross
 PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
