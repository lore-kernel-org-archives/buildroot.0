From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Oct 2012 12:55:42 +0200
Subject: [Buildroot] [git commit] ccid: Version bump to 1.4.8
Message-ID: <20121012131504.4575C9984D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0132e3638962b8c588d87ecbf1e285aed07cca0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccid/ccid.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index d1ebf8c..73db67f 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -3,9 +3,9 @@
 # CCID
 #
 # ########################################################
-CCID_VERSION = 1.4.7
+CCID_VERSION = 1.4.8
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
-CCID_SITE = http://alioth.debian.org/frs/download.php/3730
+CCID_SITE = http://alioth.debian.org/frs/download.php/3768
 CCID_INSTALL_STAGING = YES
 CCID_DEPENDENCIES = pcsc-lite host-pkg-config libusb
 
