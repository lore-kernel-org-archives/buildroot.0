From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 23 Dec 2020 16:33:23 +0100
Subject: [Buildroot] [PATCH 1/3] board/boundarydevices: promote
 buildroot-external-boundary project
Message-ID: <20201223153325.12302-1-romain.naour@smile.fr>
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
v2: remove the warning about "supported branches"
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
-- 
2.21.3
