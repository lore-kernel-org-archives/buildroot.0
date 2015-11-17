From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 09:59:18 +0100
Subject: [Buildroot] [git commit] package/perl-file-util: remove host variant
Message-ID: <20151117091039.90A8C81762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b33c324809c4928e0da827a3ec88703a73c654a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It does not build, and no one depends on it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-file-util/perl-file-util.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
index 2712aa4..fe83585 100644
--- a/package/perl-file-util/perl-file-util.mk
+++ b/package/perl-file-util/perl-file-util.mk
@@ -12,4 +12,3 @@ PERL_FILE_UTIL_LICENSE = Artistic or GPLv1+
 PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
 
 $(eval $(perl-package))
-$(eval $(host-perl-package))
