From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 May 2021 17:29:16 +0200
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: add files related
 to EDK2 for Dick Olsson
Message-ID: <20210517153259.86E56861F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=823c173639971b491440b9ec7cf93e3c166e43da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Dick Olsson <hi@senzilla.io>
[yann.morin.1998 at free.fr: drop files from patches not applied]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b688c8a8c1..2d5c692062 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -675,7 +675,14 @@ N:	Derrick Lyndon Pallas <derrick@meter.com>
 F:	package/ipcalc/
 
 N:	Dick Olsson <hi@senzilla.io>
+F:	board/aarch64-efi/
+F:	board/pc/
+F:	board/qemu/aarch64-sbsa/
+F:	boot/arm-trusted-firmware/
+F:	boot/edk2/
+F:	configs/qemu_aarch64_sbsa_defconfig
 F:	package/bearssl/
+F:	package/edk2-platforms/
 F:	package/execline/
 F:	package/mdevd/
 F:	package/s6-dns/
@@ -686,6 +693,7 @@ F:	package/s6-portable-utils/
 F:	package/s6-rc/
 F:	package/s6/
 F:	package/skalibs/
+F:	support/testing/tests/boot/test_edk2.py
 
 N:	Dimitrios Siganos <dimitris@siganos.org>
 F:	package/wireless-regdb/
