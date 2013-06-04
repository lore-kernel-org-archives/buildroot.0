From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon,  3 Jun 2013 22:03:33 -0400
Subject: [Buildroot] [PATCH 5/7] libglib2: add license info
In-Reply-To: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
References: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1370311415-1966-5-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libglib2/libglib2.mk |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.9.5
