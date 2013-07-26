From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jul 2013 21:06:09 +0200
Subject: [Buildroot] [git commit] perl-cross: bump to version 0.7.2
Message-ID: <20130726190800.477279ABE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2abba11fc359f3db1aad4f709fa0ef8112e57733
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index cbd5453..5afaaaf 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,8 +12,8 @@ PERL_LICENSE = Artistic
 PERL_LICENSE_FILES = Artistic
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.7
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_CROSS_VERSION = 0.7.2
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).3
 PERL_CROSS_SITE    = http://download.berlios.de/perlcross
 PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
