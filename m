From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 14 Oct 2011 16:56:57 +0200
Subject: [Buildroot] [PATCH 2 of 3 resend] busybox: rename busybox-update to
 busybox-update-config
In-Reply-To: <patchbomb.1318604215@localhost6.localdomain6>
References: <patchbomb.1318604215@localhost6.localdomain6>
Message-ID: <c83b93f562e2811c201d.1318604217@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original name busybox-update is confusing as it only updates a
configuration file.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 package/busybox/busybox.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -184,5 +184,5 @@
 	rm -f $(BUSYBOX_DIR)/.stamp_built
 	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
 
-busybox-update:
+busybox-update-config:
 	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
