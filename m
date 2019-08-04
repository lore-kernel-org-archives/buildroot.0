From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Aug 2019 00:03:05 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: drop odroidc2 from Dagg
 Stompler
Message-ID: <20190804220044.33D7082C8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e45febb58d645de8875b9ad6bf964b0472555fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The odroidc2_defconfig has been dropped in commit
b80712a16ae3deb65331a7923aa878e13e2e66b6, do it no longer makes sense
to list it in the DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d43a9f2c74..6f15574e39 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -576,8 +576,6 @@ F:	arch/Config.in.powerpc
 F:	package/kvm-unit-tests
 
 N:	Dagg Stompler <daggs@gmx.com>
-F:	board/hardkernel/odroidc2
-F:	configs/odroidc2_defconfig
 F:	package/libamcodec/
 F:	package/odroid-mali/
 F:	package/odroid-scripts/
