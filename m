From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 13:05:26 +0200
Subject: [Buildroot] [git commit] busybox: fix typo 'overwritting'
Message-ID: <20140714111212.92A299CE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a67ad5a3d72ef040b6a8e5b6a97dfad8741a646
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d7bfd0e..f7d28a7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -184,7 +184,7 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 endef
 endif
 
-# Enable "noclobber" in install.sh, to prevent BusyBox from overwritting any
+# Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
 define BUSYBOX_NOCLOBBER_INSTALL
 	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
