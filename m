From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 20:52:20 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add entry for
 aarch64_efi_defconfig
Message-ID: <20181208200042.5DD4C86C48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4700333c0f255254eff40886bf4c23f6440b26c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Erico Nunes recently contributed this defconfig, we can safely assume
he is willing to maintain it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8dfe579061..5c45c8c1f3 100644
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
