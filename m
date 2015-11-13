From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Nov 2015 22:48:49 +0100
Subject: [Buildroot] [PATCH 3/6] package/perl-file-util: remove host variant
In-Reply-To: <cover.1447449754.git.yann.morin.1998@free.fr>
References: <cover.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <4bdc0b12fe02ed22c775eabd485c17bbe4f372cb.1447449754.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It does not build, and no one depends on it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
---
 package/perl-file-util/perl-file-util.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
index 2712aa4..fe83585 100644
--- a/package/perl-file-util/perl-file-util.mk
+++ b/package/perl-file-util/perl-file-util.mk
@@ -12,4 +12,3 @@ PERL_FILE_UTIL_LICENSE = Artistic or GPLv1+
 PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
 
 $(eval $(perl-package))
-$(eval $(host-perl-package))
-- 
1.9.1
