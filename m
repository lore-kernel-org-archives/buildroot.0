From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:25:35 +0100
Subject: [Buildroot] [git commit] usbutils: drop double needs from comment
Message-ID: <20141210202538.8182F801A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3afd8263cae0cc6e96fdd52e825830a2c179f2db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/usbutils/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 7920ab8..923853a 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_USBUTILS
 
 	  http://linux-usb.sourceforge.net/
 
-comment "usbutils needs needs udev /dev management and toolchain w/ threads"
+comment "usbutils needs udev /dev management and toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
