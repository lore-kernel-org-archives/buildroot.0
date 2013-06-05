From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 10:39:06 +0200
Subject: [Buildroot] [git commit] libglib2: add license info
Message-ID: <20130605090356.D50859A95D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8f0d6638ea8677ff1be57bbe16277a16c80ff2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglib2/libglib2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 3ac78ba..194fa64 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -8,6 +8,8 @@ LIBGLIB2_VERSION_MINOR = 3
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
+LIBGLIB2_LICENSE = LGPLv2+
+LIBGLIB2_LICENSE_FILES = COPYING
 
 LIBGLIB2_AUTORECONF = YES
 HOST_LIBGLIB2_AUTORECONF = YES
