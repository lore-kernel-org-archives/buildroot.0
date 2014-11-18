From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:45:06 +0100
Subject: [Buildroot] [git commit] perl-cross: bump to version 0.9.4
Message-ID: <20141118224956.A89E4B495B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=530f12d29d88bdca2b4b4650ab2464e7e7920a20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this release fixes the build when BR2_PREFER_STATIC_LIB
see http://autobuild.buildroot.net/results/057/057a4b9976fd6b9c5cddd117a3f29de51efe719f/build-end.log
see https://github.com/arsv/perl-cross/issues/11

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 9684668..06855ab 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,7 +12,7 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.9.3
+PERL_CROSS_VERSION = 0.9.4
 PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
