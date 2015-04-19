From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 19:24:22 +0200
Subject: [Buildroot] [git commit] package/fbdump: Add project URL to
	Config.in
Message-ID: <20150419172623.7945280797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c990ef28c7f48a911e32f49150237f826b2a771a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fbdump/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fbdump/Config.in b/package/fbdump/Config.in
index 7910713..982448d 100644
--- a/package/fbdump/Config.in
+++ b/package/fbdump/Config.in
@@ -5,3 +5,5 @@ config BR2_PACKAGE_FBDUMP
 	  framebuffer  device and write them out as a PPM file. Currently,
 	  most packed-pixel framebuffer formats and the vga16 framebuffer
 	  are supported.
+
+	  http://www.rcdrummond.net/fbdump
