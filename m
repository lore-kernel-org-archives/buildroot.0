From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 10:26:21 +0200
Subject: [Buildroot] [git commit] udev:
	s/BR2_TOOLCHAIN_USE_THREADS/BR2_TOOLCHAIN_HAS_THREADS/
Message-ID: <20130810082620.082539B291@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a768080186ef66684498f33ac0506085fdb9ce50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug fix.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/udev/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index ed32c89..dd5ad7b 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -32,7 +32,7 @@ config BR2_PACKAGE_UDEV_ALL_EXTRAS
 	  libacl, hwdata and libglib2
 
 comment "enabling all extras requires a toolchain with WCHAR and threading support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_USE_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
 
