From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 22 Jun 2014 15:45:42 +0200
Subject: [Buildroot] [PATCH 3 of 5 RFC] busybox: fix typo overwritting
In-Reply-To: <patchbomb.1403444739@localhost>
References: <patchbomb.1403444739@localhost>
Message-ID: <6bb6b3f59fd51d762776.1403444742@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/busybox/busybox.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff -r 62a7dd35bfbf -r 6bb6b3f59fd5 package/busybox/busybox.mk
--- a/package/busybox/busybox.mk	Mon Jun 16 20:18:23 2014 +0200
+++ b/package/busybox/busybox.mk	Sun Jun 22 15:29:01 2014 +0200
@@ -189,7 +189,7 @@
 endef
 endif
 
-# Enable "noclobber" in install.sh, to prevent BusyBox from overwritting any
+# Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
 define BUSYBOX_NOCLOBBER_INSTALL
 	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
