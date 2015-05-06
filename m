From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 22:50:27 +0200
Subject: [Buildroot] [git commit] giflib: remove from the description the
	reference to libungif
Message-ID: <20150506205034.16BD58081B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2633f0e54645f0fc44e25e3363bb41fe03356f72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting from version 5.0 giflib it's no longer compatible with
libungif, also the libungif is now deprecated so just remove the
reference to libungif.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/giflib/Config.in |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/giflib/Config.in b/package/giflib/Config.in
index 70368dc..fc1f85d 100644
--- a/package/giflib/Config.in
+++ b/package/giflib/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_GIFLIB
 	bool "giflib"
 	help
-	  giflib is a library for reading and writing gif images. It is API and
-	  ABI compatible with libungif which was in wide use while the LZW
-	  compression algorithm was patented.
+	  giflib is a library for reading and writing gif images.
 
 	  http://sourceforge.net/projects/giflib
