From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 00:24:55 +0200
Subject: [Buildroot] [git commit] libsepol: add missing dependency on
	host-flex
Message-ID: <20160701222541.4615A8212B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13b81dee2aae3678673560d68140eeffd07fa41d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/580037bd376188e18a4a58927c929d21e9b2b03c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsepol/libsepol.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 93896cf..c53707a 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -10,6 +10,7 @@ LIBSEPOL_LICENSE = LGPLv2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
 LIBSEPOL_INSTALL_STAGING = YES
+LIBSEPOL_DEPENDENCIES = host-flex
 
 LIBSEPOL_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS)
 
