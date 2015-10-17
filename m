From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 17 Oct 2015 09:30:34 +0200
Subject: [Buildroot] [PATCH 1/1] libfribidi: indentation cleanup
Message-ID: <1445067034-3018-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libfribidi/libfribidi.mk               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.9.1
