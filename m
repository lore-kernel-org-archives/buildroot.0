From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Sep 2019 09:47:41 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add Gerome Burlats as contact
 for Qemu defconfigs
Message-ID: <20190909074315.E2A3F8D6A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8acb79e9f3fa0d7a5b601267d9a2bbc99f65d900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gerome Burlats recently took care of the Qemu defconfigs, so it makes
sense to list him as a contact for the maintenance of these
defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gerome Burlats <gerome.burlats@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Acked-by: Gerome Burlats <gerome.burlats@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index de0414606e..58d18a36e8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -941,6 +941,10 @@ N:	Geoffrey Ragot <geoffreyragot@gmail.com>
 F:	package/python-pycli/
 F:	package/python-pyyaml/
 
+N:	Gerome Burlats <gerome.burlats@smile.fr>
+F:	board/qemu/
+F:	configs/qemu_*
+
 N:	Gilles Talis <gilles.talis@gmail.com>
 F:	board/freescale/imx8mmevk/
 F:	configs/freescale_imx8mmevk_defconfig
