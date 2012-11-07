From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Nov 2012 20:15:22 +0100
Subject: [Buildroot] [git commit] iw: add license information
Message-ID: <20121107193959.87A4E99C3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e15babb4980abeaa4a392145989af11a757ba7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 651a2ca..19ede3a 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -7,6 +7,8 @@
 IW_VERSION = 3.7
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
+IW_LICENSE = iw license
+IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
 IW_CONFIG = $(IW_DIR)/.config
 IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
