From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 22:18:52 +0100
Subject: [Buildroot] [git commit] configs: rename rpi_defconfig for
	consistency
Message-ID: <20131110223451.A4E579BB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=094d8ec896ef0c447a4bfb884753bf8984d67dbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We name all of our boards and defconfig files based on the boards
fullname, not a nickname or a shortname.

'rpi' is short for Raspberry Pi, so name all our Raspberry Pi ressource
with 'raspberrypi' instead of 'rpi'.

This should also help Buildroot-newcomers to recognise Raspberry Pi
related files (defconfig and board doc).

Signed-off-by: Mathieu Benoit <mathieu.benoit@savoirfairelinux.com>
[yann.morin.1998 at free.fr: reverse the rename]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/readme.txt                     |    8 ++++----
 configs/{rpi_defconfig => raspberrypi_defconfig} |    0
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 47b4818..2052e2b 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -17,11 +17,11 @@ How to build it
 Configure Buildroot
 -------------------
 
-The rpi_defconfig configuration is a minimal configuration with all that
-is required to bring the Raspberry Pi. You should base your work on this
-defconfig:
+The raspberrypi_defconfig configuration is a minimal configuration with
+all that is required to bring the Raspberry Pi. You should base your
+work on this defconfig:
 
-  $ make rpi_defconfig
+  $ make raspberrypi_defconfig
 
 If you want to use a persistent rootfs, skip to "Build the rootfs", below.
 
diff --git a/configs/rpi_defconfig b/configs/raspberrypi_defconfig
similarity index 100%
rename from configs/rpi_defconfig
rename to configs/raspberrypi_defconfig
