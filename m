From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jun 2021 21:55:39 +0200
Subject: [Buildroot] [git commit] package/perl-type-tiny: bump to version
 1.012003
Message-ID: <20210614192528.795F382A89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e990f1c9d9c57dbcb36d861458180a9a121d4153
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-type-tiny/perl-type-tiny.hash | 4 ++--
 package/perl-type-tiny/perl-type-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-type-tiny/perl-type-tiny.hash b/package/perl-type-tiny/perl-type-tiny.hash
index 2e2726e38d..db0d2d43a0 100644
--- a/package/perl-type-tiny/perl-type-tiny.hash
+++ b/package/perl-type-tiny/perl-type-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  7feab0f3f99810290a3fdea8dbf24d7b  Type-Tiny-1.012001.tar.gz
-sha256  f907e5ad880fcc42fddb7e0de53c59429282abcbb3afb1a8651bf5ec6c42954d  Type-Tiny-1.012001.tar.gz
+md5  3fac9bc52b55ba3c3bb75151493424b2  Type-Tiny-1.012003.tar.gz
+sha256  d41be1d944899e47e0a56ae1c9ca0b64b8b53eccb554184d47da4b3927cd2168  Type-Tiny-1.012003.tar.gz
 
 # computed by scancpan
 sha256  34427749499bd6d6e5d206089bc03d76c647a1350f8b5f95ea628d2b6ff56e4c  LICENSE
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 2a475e53db..170ea37df0 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TYPE_TINY_VERSION = 1.012001
+PERL_TYPE_TINY_VERSION = 1.012003
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
