From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:30:21 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] board/boundarydevices:
 promote buildroot-external-boundary project
Message-ID: <20201227082413.901F7815BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24016d8ad548fd13bfcaed61d76ebdd68dd3d94c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

It may be useful for users using Boundary Devices boards to find
more advanced defconfigs than the one provided by Buildroot.

See:
https://github.com/boundarydevices/buildroot-external-boundary#configurations-details

Update the readme.txt to add the link to the br2_external maintained
by Boundary Devices.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 75543322843f9ce72a4f39f1ee6239059c061e6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/boundarydevices/common/readme.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/board/boundarydevices/common/readme.txt b/board/boundarydevices/common/readme.txt
index d1bb3fa598..307cfb5549 100644
--- a/board/boundarydevices/common/readme.txt
+++ b/board/boundarydevices/common/readme.txt
@@ -40,3 +40,9 @@ Where 'sdX' is the device node of the uSD partition.
 To upgrade u-boot, cancel autoboot and type:
 
 > run upgradeu
+
+See Boundary Devices's buildroot-external-boundary project
+for additional and advanced defconfigs using Qt5, gstreamer,
+NXP proprietary packages with demo applications:
+
+https://github.com/boundarydevices/buildroot-external-boundary
