From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 08:11:36 +0200
Subject: [Buildroot] [git commit] package/python3: fix hash for license file
Message-ID: <20190411060727.A78E48E15B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf6615d801e72c286f84adb3d64231b2646b6326
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The year was updated.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/python3.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 9a7904c1d5..d5209c23cc 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -2,4 +2,4 @@
 md5		93df27aec0cd18d6d42173e601ffbbfd Python-3.7.3.tar.xz
 # Locally computed
 sha256 da60b54064d4cfcd9c26576f6df2690e62085123826cff2e667e72a91952d318 Python-3.7.3.tar.xz
-sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2 LICENSE
+sha256 a77d71d6be6f9032e6b6e5d2cf6da68f9eeab9036edfbc043633c8979cd5e82c LICENSE
