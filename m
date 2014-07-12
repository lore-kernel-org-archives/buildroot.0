From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 12 Jul 2014 21:21:16 +0200
Subject: [Buildroot] [PATCH trivial] busybox: fix typo 'overwritting'
Message-ID: <197abaf75c205828d953.1405192876@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/busybox/busybox.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff -r dbc59780479b -r 197abaf75c20 package/busybox/busybox.mk
--- a/package/busybox/busybox.mk	Thu Jul 10 20:25:13 2014 +0400
+++ b/package/busybox/busybox.mk	Sat Jul 12 21:19:46 2014 +0200
@@ -184,7 +184,7 @@
 endef
 endif
 
-# Enable "noclobber" in install.sh, to prevent BusyBox from overwritting any
+# Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
 define BUSYBOX_NOCLOBBER_INSTALL
 	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
