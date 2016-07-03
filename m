From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:13:33 +0200
Subject: [Buildroot] [git commit] libsepol: add explicit dependencies for
	host variant
Message-ID: <20160703071557.E7ED07FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94eb3843f9da07844e14747b68c412fb8764dd65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsepol/libsepol.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index c53707a..3b02175 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -11,6 +11,7 @@ LIBSEPOL_LICENSE_FILES = COPYING
 
 LIBSEPOL_INSTALL_STAGING = YES
 LIBSEPOL_DEPENDENCIES = host-flex
+HOST_LIBSEPOL_DEPENDENCIES = host-flex
 
 LIBSEPOL_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS)
 
