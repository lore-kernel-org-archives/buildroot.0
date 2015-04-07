From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 21:32:16 +0200
Subject: [Buildroot] [git commit] libvpx: name the supported formats.
Message-ID: <20150407193223.45913819B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f72480cf124ebd816a5e0a7fcd0c9e8f0ef7ace0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvpx/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libvpx/Config.in b/package/libvpx/Config.in
index 0ed3e1a..6b0400c 100644
--- a/package/libvpx/Config.in
+++ b/package/libvpx/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBVPX
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A high-quality, open video format that's freely available to
-	  everyone.
+	  everyone. Supports the VP8 and VP9 formats.
 
 	  http://webmproject.org
 
