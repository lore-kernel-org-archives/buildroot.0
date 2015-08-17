From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 16:24:25 +0200
Subject: [Buildroot] [git commit] libv4l: update homepage link
Message-ID: <20150817143015.42445819CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ffa368342aa13bd79f0e672d9eefe26f0ab85de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The official wiki page is more informative and up to date.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index da9bd83..d137613 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_LIBV4L
 	  layer on top of video4linux2 devices. libv4l consists of 3 different
 	  libraries: libv4lconvert, libv4l1 and libv4l2.
 
-	  http://freshmeat.net/projects/libv4l
+	  http://linuxtv.org/wiki/index.php/V4l-utils
 
 if BR2_PACKAGE_LIBV4L
 
