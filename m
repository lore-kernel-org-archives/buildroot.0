From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:08:41 +0200
Subject: [Buildroot] [git commit branch/next] flashrom: improve Config.in
	description
Message-ID: <20150521211005.E552880E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=317dfa83b063197e03b247b59e30ef848924a922
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use some text from the flashrom website to provide a better Config.in
help text about flashrom.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flashrom/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 17a0416..9420cc6 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -10,7 +10,11 @@ config BR2_PACKAGE_FLASHROM
 	depends on BR2_TOOLCHAIN_HAS_THREADS 	# libusb
 	depends on BR2_ARCH_HAS_ATOMICS 	# libftdi
 	help
-	  BIOS-updating utility.
+	  flashrom is a utility for identifying, reading, writing,
+	  verifying and erasing flash chips. It is designed to flash
+	  BIOS/EFI/coreboot/firmware/optionROM images on mainboards,
+	  network/graphics/storage controller cards, and various other
+	  programmer devices.
 
 	  http://flashrom.org/
 
