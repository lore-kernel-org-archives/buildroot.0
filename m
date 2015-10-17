From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:06:27 +0200
Subject: [Buildroot] [git commit] libfribidi: indentation cleanup
Message-ID: <20151017140654.DEF4781947@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b7a1dec316effab9f5adf2b147c9abf4f7afdde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfribidi/libfribidi.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 12e7664..1cf3b7c 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -16,9 +16,9 @@ LIBFRIBIDI_AUTORECONF = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
- LIBFRIBIDI_DEPENDENCIES += libglib2
+LIBFRIBIDI_DEPENDENCIES += libglib2
 else
- LIBFRIBIDI_CONF_OPTS += --with-glib=no
+LIBFRIBIDI_CONF_OPTS += --with-glib=no
 endif
 
 $(eval $(autotools-package))
