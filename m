From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Sep 2019 20:04:58 +0200
Subject: [Buildroot] [git commit] package/libsemanage: reformat
 HOST_LIBSEMANAGE_DEPENDENCIES
Message-ID: <20190922180710.C9EB18F0C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af59564e2603205935e0a0c01580c2362cd4f9fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a more common formatting for HOST_LIBSEMANAGE_DEPENDENCIES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsemanage/libsemanage.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 9a4ddc1a4d..bd1e01febf 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -25,8 +25,13 @@ define LIBSEMANAGE_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
-HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libselinux \
-				host-bzip2 host-swig
+HOST_LIBSEMANAGE_DEPENDENCIES = \
+	host-bison \
+	host-audit \
+	host-libsepol \
+	host-libselinux \
+	host-bzip2 \
+	host-swig
 
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	$(HOST_CONFIGURE_OPTS) \
