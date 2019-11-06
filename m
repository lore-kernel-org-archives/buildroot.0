From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 15:40:47 +0100
Subject: [Buildroot] [git commit] CHANGES: minor fixups for 2019.11-rc1 entry
Message-ID: <20191106143512.5410A8E88F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bcc20f1faf3acfe09973a67a91590eaf1892a82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Clarify that the new floating point ABI logic is for RISC-V and add the
linux-serial-test package that got added just before -rc1.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index ab9f10278e..f02f2a9f22 100644
--- a/CHANGES
+++ b/CHANGES
@@ -26,9 +26,9 @@
 	Libre Computer "La Frite", QEMU Armv7-A with trustzone/OP-TEE,
 	STM32MP157 Discovery Kit
 
-	Arch: Default to a sensible floating point ABI based on the
-	selected ISA extensions rather than always defaulting to
-	ILP32/64
+	Arch: RISC-V: Default to a sensible floating point ABI based
+	on the selected ISA extensions rather than always defaulting
+	to ILP32/64
 
 	Graph-size: Package sizes are now shown in human readable form
 	(Kib/Mib/Gib) rather than always in Kib. Binary (KB/MB/GB)
@@ -63,9 +63,9 @@
 
 	New packages: caps, collectl, dav1d, fstrcmp, ima-evm-utils,
 	jitterentropy-library, kodi-vfs-rar, kodi-vfs-sftp, libavl,
-	libhttpserver, libmspack, libnetconf2, libolm, libyang, lrzip,
-	mdevd, minimodem, musl-fts, netifrc, ogre, openlayers,
-	python-aioredis, python-asgiref,
+	libhttpserver, libmspack, libnetconf2, libolm, libyang,
+	linux-serial-test, lrzip, mdevd, minimodem, musl-fts, netifrc,
+	ogre, openlayers, python-aioredis, python-asgiref,
 	python-backports-functools-lru-cache, python-bluezero,
 	python-brotli, python-channels, python-channels-redis,
 	python-colorlog, python-daphne, python-django-enumfields,
