From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 22:25:35 +0200
Subject: [Buildroot] [git commit] package/perl-libwww: Fix legal-info
Message-ID: <20150420202614.1837781D49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78080092e8d26666d84f65a0cfe6b3d45193bdf2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/6c6/6c6fb6001101ff528176b887ed8c95ef49313afb/
http://autobuild.buildroot.net/results/56d/56d42e7691d4eb1a682c49c0fa6c951d0e3069ec/

[Thomas: use the README file, since it contains a copyright notice and
the name of the license, instead of not having any license file at
all.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-libwww/perl-libwww.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/perl-libwww/perl-libwww.mk b/package/perl-libwww/perl-libwww.mk
index 0ee1e04..8157be2 100644
--- a/package/perl-libwww/perl-libwww.mk
+++ b/package/perl-libwww/perl-libwww.mk
@@ -7,7 +7,7 @@
 PERL_LIBWWW_VERSION = 6.13
 PERL_LIBWWW_SITE = $(call github,libwww-perl,libwww-perl,$(PERL_LIBWWW_VERSION))
 PERL_LIBWWW_LICENSE = Artistic or GPLv1+
-PERL_LIBWWW_LICENSE_FILES = LICENSE
+PERL_LIBWWW_LICENSE_FILES = README
 PERL_LIBWWW_DEPENDENCIES = \
 	perl-encode-locale \
 	perl-file-listing \
