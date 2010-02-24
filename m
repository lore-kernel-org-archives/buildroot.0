From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 22:59:32 +0100
Subject: [Buildroot] [git commit master] libgtk2: host version needs
	host-libpng
Message-ID: <20100224220114.B7BB177798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2edfc313c0c996c7c3d815c722b68c37fbf5950c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index cc62c73..1e732d0 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -126,7 +126,7 @@ endif
 # gtk-update-icon-cache, which are the host tools needed to build Gtk
 # for the target.
 
-HOST_LIBGTK2_DEPENDENCIES = host-libglib2
+HOST_LIBGTK2_DEPENDENCIES = host-libglib2 host-libpng
 HOST_LIBGTK2_AUTORECONF = YES
 HOST_LIBGTK2_CONF_OPT = \
 		--disable-static \
-- 
1.6.3.3
