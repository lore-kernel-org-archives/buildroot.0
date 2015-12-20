From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:54:31 +0100
Subject: [Buildroot] [git commit] directfb-examples: indentation cleanup
Message-ID: <20151220125435.85AF281F80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b06cc9e0ccaaeee7215bb5841b55e974c5d0678
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb-examples/directfb-examples.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index ee883f7..46263da 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -12,7 +12,7 @@ DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
 DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
 
 ifeq ($(BR2_STATIC_LIBS),y)
-        DIRECTFB_EXAMPLES_CONF_OPTS += LIBS=-lstdc++
+DIRECTFB_EXAMPLES_CONF_OPTS += LIBS=-lstdc++
 endif
 
 $(eval $(autotools-package))
