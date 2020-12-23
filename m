From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 23 Dec 2020 13:56:51 +0100
Subject: [Buildroot] [PATCH] board/boundarydevices: add promote
 buildroot-external-boundary project
Message-ID: <20201223125651.6818-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It may be useful for users using Boundary Devices boards to find
more advanced defconfigs that the one provided by Buildroot.

See:
https://github.com/boundarydevices/buildroot-external-boundary#configurations-details

Update the readme.txt to add the link to the br2_external maintained
by Boundary Devices.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/boundarydevices/common/readme.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/board/boundarydevices/common/readme.txt b/board/boundarydevices/common/readme.txt
index d1bb3fa598..62bc0d3f81 100644
--- a/board/boundarydevices/common/readme.txt
+++ b/board/boundarydevices/common/readme.txt
@@ -40,3 +40,13 @@ Where 'sdX' is the device node of the uSD partition.
 To upgrade u-boot, cancel autoboot and type:
 
 > run upgradeu
+
+See Boundary Devices's buildroot-external-boundary project
+for additional and advanced defconfigs using Qt5, gstreamer,
+NXP proprietary packages with demo applications:
+
+https://github.com/boundarydevices/buildroot-external-boundary
+
+Only some stable Buildroot releases are supported (2017.08.x,
+2018.02.x, 2020.08.x). Using another Buildroot version may
+requires some work.
-- 
2.21.3
