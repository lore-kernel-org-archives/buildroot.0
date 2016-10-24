From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 23:34:53 +0200
Subject: [Buildroot] [git commit] package/ts4900-fpga: remove the default
	value of the _INSTALL_{IMAGES, TARGET} variables
Message-ID: <20161024213500.C696B81D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cbef932b9c5bda880dcb49509252519ac6aa880
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ts4900-fpga/ts4900-fpga.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
index e0d351f..ed951b8 100644
--- a/package/ts4900-fpga/ts4900-fpga.mk
+++ b/package/ts4900-fpga/ts4900-fpga.mk
@@ -10,9 +10,6 @@ TS4900_FPGA_SITE = ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-
 # No license file provided, Yocto recipe from the vendor claims MIT.
 # https://github.com/embeddedarm/meta-ts/blob/f31860f1204b64f765a5380d3b93a2cf18234f90/recipes-extras/ts4900-fpga/ts4900-fpga.bb#L6
 
-TS4900_FPGA_INSTALL_IMAGES = NO
-TS4900_FPGA_INSTALL_TARGET = YES
-
 define TS4900_FPGA_EXTRACT_CMDS
 	cp $(DL_DIR)/$(TS4900_FPGA_SOURCE) $(@D)
 endef
