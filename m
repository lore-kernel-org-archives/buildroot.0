From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Mar 2013 20:50:37 +0100
Subject: [Buildroot] [git commit] hplip: needs C++ support in toolchain
Message-ID: <20130320195007.064AC9B1DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66f962224aaaad5a79e3ff49804db8034e8cdd65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out by Thomas.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hplip/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index 5bcd63b..d8a1580 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HPLIP
 	bool "hplip"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_CUPS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_JPEG
