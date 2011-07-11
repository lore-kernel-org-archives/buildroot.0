From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 15:53:54 +0200
Subject: [Buildroot] [PATCH 10/12] at91dataflashboot: use "config" instead
	of "menuconfig"
In-Reply-To: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b2fcb2072644e90dc7316b5861ceb5791007eb77.1310392269.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since at91dataflashboot, using "menuconfig" is useless and confusing,
as it creates an empty submenu in the configuration interface.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91dataflashboot/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index 88cd058..a4efe11 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,3 +1,3 @@
-menuconfig BR2_TARGET_AT91DATAFLASHBOOT
+config BR2_TARGET_AT91DATAFLASHBOOT
        depends on BR2_arm
        bool "AT91 DataFlashBoot"
-- 
1.7.4.1
