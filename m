From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Dec 2018 16:01:21 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add entry for aarch64_efi_defconfig
Message-ID: <20181208150121.4146-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erico Nunes recently contributed this defconfig, we can safely assume
he is willing to maintain it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c289b3f0c5..2209346f0a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -658,6 +658,8 @@ F:	package/pifmrds/
 F:	package/ympd/
 
 N:	Erico Nunes <nunes.erico@gmail.com>
+F:	board/aarch64-efi/
+F:	configs/aarch64_efi_defconfig
 F:	package/acpica/
 F:	package/acpitool/
 F:	package/efibootmgr/
-- 
2.19.2
