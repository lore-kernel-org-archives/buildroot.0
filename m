From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 13:58:07 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: Fix warning with get-developers
Message-ID: <20201008114720.F14318E184@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7249f2f76f9fdcc2cf8a4490061b439c90186b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a typo between 'N' (for Firstname Lastname <email>) & 'F'
(for file pattern or directory)

$: ./utils/get-developers outgoing/*
WARNING: 'Sven Fischer <sven@leiderfischer.de>' doesn't match any file

Fixes: e7ebc7cd0905d7 ("package/qt5/qt5remoteobjects: new package")

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 354b85605f..3eceebfcbd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2538,8 +2538,8 @@ F:	configs/rock_pi_n10_defconfig
 F:	configs/rockpro64_defconfig
 F:	package/arm-gnu-a-toolchain/
 
-F:	Sven Fischer <sven@leiderfischer.de>
-N:	package/qt5/qt5remoteobjects/
+N:	Sven Fischer <sven@leiderfischer.de>
+F:	package/qt5/qt5remoteobjects/
 
 N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
 F:	package/lcdproc/
