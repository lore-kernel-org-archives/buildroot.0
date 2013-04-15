From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 09:06:21 +0200
Subject: [Buildroot] [git commit] ofono: add license information
Message-ID: <20130415070951.DDFB09B5EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ced147780401a3791a399dbf1d2f466572ad4ccf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ofono/ofono.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 5410c98..9b1181a 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -3,8 +3,11 @@
 # ofono
 #
 #############################################################
+
 OFONO_VERSION = 1.12
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
+OFONO_LICENSE = GPLv2
+OFONO_LICENSE_FILES = COPYING
 OFONO_DEPENDENCIES = \
 	host-pkgconf \
 	dbus \
