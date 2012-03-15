From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 23:33:07 +0100
Subject: [Buildroot] [git commit] libffi: bump version to 3.0.10
Message-ID: <20120315225951.9231290DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5dce78c22a6135d0e7367025079c216107934111
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libffi/libffi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index e9e87ef..2181ea1 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBFFI_VERSION = 3.0.9
+LIBFFI_VERSION = 3.0.10
 LIBFFI_SITE    = ftp://sources.redhat.com/pub/libffi/
 
 LIBFFI_INSTALL_STAGING = YES
