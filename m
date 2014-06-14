From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 18:39:19 +0200
Subject: [Buildroot] [git commit] package/libatasmart: point to a better
	homepage
Message-ID: <20140614163955.C42C89CBEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91fc913510c493b133c8b02987684e365e33b09b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libatasmart/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
index 534e7c1..9db3b09 100644
--- a/package/libatasmart/Config.in
+++ b/package/libatasmart/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBATASMART
 	  The libatasmart package is a disk reporting library.
 	  It only supports a subset of the ATA S.M.A.R.T. functionality.
 
-	  http://www.linuxfromscratch.org/blfs/view/svn/general/libatasmart.html
+	  http://0pointer.de/blog/projects/being-smart.html
 
 comment "libatasmart requires udev to be enabled"
 	depends on !BR2_PACKAGE_HAS_UDEV
