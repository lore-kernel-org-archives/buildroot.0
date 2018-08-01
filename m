From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 09:47:25 +0200
Subject: [Buildroot] [git commit] linux-firmware: update hash of
 LICENSE.amdgpu
Message-ID: <20180801074546.8C1028B393@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a06bac0c851ed1eb458ff0a85b53002fcd46e8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 51435be1f1e8d4f7f50c95a406ecde6cb0e22418 ("linux-firmware:
bump version to latest 8d69bab"), the hash of the LICENSE.amdgpu was
not updated as it should have been. Indeed, there was a copyright year
change in this file:

-Copyright (C) 2017  Advanced Micro Devices, Inc. All rights reserved.
+Copyright (C) 2018  Advanced Micro Devices, Inc. All rights reserved.

which changed the hash of this license file.

Fixes:

  http://autobuild.buildroot.net/results/cc0e44fa854597b8a83dfdcd6435cb55af1c8571/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index ede2068c6d..b1f46b97e9 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,7 +1,7 @@
 # Locally calculated
 sha256 905be20e4e2d7628dea4e2e99195520fc0cce8b247faabdc52fc44a3ff2ceb04 linux-firmware-8d69bab7a3da1913113ea98cefb73d5fa6988286.tar.gz
 sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
-sha256 448a367f518ff62c0501ded89c3da03cd3b632aa05bf62b4d5b969b136476d96 LICENSE.amdgpu
+sha256 4b3ea5d5a03c0db81bee0bcb14b30d75b30ef568597bb5be7d4dee57f434265f LICENSE.amdgpu
 sha256 38f2037aa14631b4b29826d7a99379613c41a97064d1defdee30a7a022138b20 LICENCE.Marvell
 sha256 802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2 LICENCE.atheros_firmware
 sha256 3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
