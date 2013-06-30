From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jun 2013 10:32:37 +0200
Subject: [Buildroot] [git commit] libhid: fix download URL
Message-ID: <20130630083505.0DAD19B173@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df91b9eb6e8d6181d9c49834a1444344f8814e53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c65/c652df3854dec40e6420cba8a6d48c8ddc9b1ecd/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libhid/libhid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 530ef50..4cecd34 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -6,7 +6,7 @@
 
 LIBHID_VERSION = 0.2.16
 LIBHID_SOURCE = libhid-$(LIBHID_VERSION).tar.gz
-LIBHID_SITE = http://alioth.debian.org/frs/download.php/1958
+LIBHID_SITE = http://alioth.debian.org/frs/download.php/file/1958
 LIBHID_DEPENDENCIES = libusb-compat libusb
 LIBHID_INSTALL_STAGING = YES
 LIBHID_AUTORECONF = YES
