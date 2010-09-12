From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 20:33:13 +0200
Subject: [Buildroot] [PATCH 1/5] pcmcia: remove deprecated package
In-Reply-To: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
Message-ID: <19cd7a3adc66ec2a121152fe149ef769573ee554.1284316268.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated on http://pcmcia-cs.sourceforge.net/: "The Linux pcmcia-cs
package is officially deprecated. It can only be used with 2.4 and
older kernels.".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/at91rm9200df_defconfig       |    1 -
 configs/at91rm9200df_ext_defconfig   |    1 -
 configs/at91sam9260dfc_defconfig     |    1 -
 configs/at91sam9260dfc_ext_defconfig |    1 -
 configs/at91sam9260pf_defconfig      |    1 -
 configs/at91sam9261ek_defconfig      |    1 -
 configs/at91sam9261ek_ext_defconfig  |    1 -
 configs/at91sam9263ek_defconfig      |    1 -
 configs/at91sam9263ek_ext_defconfig  |    1 -
 configs/at91sam9g20dfc_defconfig     |    1 -
 configs/at91sam9g20dfc_ext_defconfig |    1 -
 configs/atngw100-base_defconfig      |    1 -
 configs/atngw100_defconfig           |    1 -
 configs/atstk1005_defconfig          |    1 -
 configs/atstk100x_defconfig          |    1 -
 configs/i386_defconfig               |    1 -
 configs/i686_defconfig               |    1 -
 configs/integrator926_defconfig      |    1 -
 configs/integrator926_huge_defconfig |    1 -
 configs/kb9202_defconfig             |    1 -
 package/Config.in                    |    1 -
 package/pcmcia/Config.in             |    9 ---
 package/pcmcia/pcmcia.mk             |  114 -------------------------------
 package/pcmcia/pcmcia.patch          |  123 ----------------------------------
 24 files changed, 0 insertions(+), 267 deletions(-)
 delete mode 100644 package/pcmcia/Config.in
 delete mode 100644 package/pcmcia/pcmcia.mk
 delete mode 100644 package/pcmcia/pcmcia.patch

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 727a6ea..8abbef9 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -623,7 +623,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 BR2_PACKAGE_UDEV_VOLUME_ID=y
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index c73e372..54755e7 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -552,7 +552,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 BR2_PACKAGE_UDEV_VOLUME_ID=y
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index de002c4..c0dbac1 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -637,7 +637,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 BR2_PACKAGE_UDEV_VOLUME_ID=y
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 91cdedd..3a6191d 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -560,7 +560,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 BR2_PACKAGE_UDEV_VOLUME_ID=y
diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index ab29133..0bc17ae 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -423,7 +423,6 @@ BR2_BLOCKDEV_SUPPORT=y
 # BR2_PACKAGE_MKDOSFS is not set
 # BR2_PACKAGE_MTD is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_RAIDTOOLS is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SFDISK is not set
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 0a1fc51..dd63d5b 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -580,7 +580,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 BR2_PACKAGE_UDEV_VOLUME_ID=y
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 6ebe9fd..367bcfa 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -539,7 +539,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 BR2_PACKAGE_UDEV_VOLUME_ID=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index d293108..8fb9b00 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -577,7 +577,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 BR2_PACKAGE_UDEV_VOLUME_ID=y
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index 843b0fb..3f6e478 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -502,7 +502,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 BR2_PACKAGE_UDEV_VOLUME_ID=y
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index a9347a8..bdab741 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -573,7 +573,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 BR2_PACKAGE_UDEV_VOLUME_ID=y
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index bd96723..cb21324 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -560,7 +560,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 BR2_PACKAGE_SETSERIAL=y
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 BR2_PACKAGE_UDEV_VOLUME_ID=y
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index 116f671..0af8bc2 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -486,7 +486,6 @@ BR2_PACKAGE_MTD_NANDWRITE=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS_3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 # BR2_PACKAGE_USBMOUNT is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 50c376b..01d0d7a 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -428,7 +428,6 @@ BR2_PACKAGE_MTD_UBIUPDATEVOL=y
 # BR2_PACKAGE_NTFS_3G is not set
 # BR2_PACKAGE_NTFSPROGS is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 # BR2_PACKAGE_SQUASHFS is not set
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index d95b666..2e6d94f 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -537,7 +537,6 @@ BR2_PACKAGE_MTD_MTD_DEBUG=y
 # BR2_PACKAGE_MTD_SUMTOOL is not set
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 # BR2_PACKAGE_USBMOUNT is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 3069f6a..ca9902f 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -544,7 +544,6 @@ BR2_PACKAGE_MTD_MTD_DEBUG=y
 # ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
 #
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SFDISK is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index e30ec3f..184bc30 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -484,7 +484,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS_3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 # BR2_PACKAGE_USBMOUNT is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 916454d..e537a8a 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -484,7 +484,6 @@ BR2_PACKAGE_MTD_NFTLDUMP=y
 BR2_PACKAGE_MTD_SUMTOOL=y
 # BR2_PACKAGE_NTFS_3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 # BR2_PACKAGE_USBMOUNT is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 3d82ba2..cd25820 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -471,7 +471,6 @@ BR2_PACKAGE_TCPDUMP=y
 # BR2_PACKAGE_MTD is not set
 # BR2_PACKAGE_NTFS-3G is not set
 BR2_PACKAGE_PCIUTILS=y
-# BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 # BR2_PACKAGE_USBMOUNT is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index ca13339..cc6e866 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -453,7 +453,6 @@ BR2_PACKAGE_TCPDUMP=y
 # BR2_PACKAGE_MTD is not set
 # BR2_PACKAGE_NTFS-3G is not set
 BR2_PACKAGE_PCIUTILS=y
-# BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
 # BR2_PACKAGE_USBMOUNT is not set
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index 4f392ab..842a8a6 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -473,7 +473,6 @@ BR2_BLOCKDEV_SUPPORT=y
 # BR2_PACKAGE_MTD is not set
 # BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
-# BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_RAIDTOOLS is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SFDISK is not set
diff --git a/package/Config.in b/package/Config.in
index d60d8ef..ce730ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -180,7 +180,6 @@ source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
 source "package/pciutils/Config.in"
-source "package/pcmcia/Config.in"
 source "package/setserial/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # busybox has fdisk
diff --git a/package/pcmcia/Config.in b/package/pcmcia/Config.in
deleted file mode 100644
index de1e33b..0000000
--- a/package/pcmcia/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PCMCIA
-	bool "pcmcia"
-	depends on BR2_PACKAGE_LINUX
-	# The website says it's deprecated after 2.4.x kernels
-	depends on BR2_DEPRECATED
-	help
-	  PCMCIA tools for Linux.
-
-	  http://pcmcia-cs.sourceforge.net/
diff --git a/package/pcmcia/pcmcia.mk b/package/pcmcia/pcmcia.mk
deleted file mode 100644
index 8080b87..0000000
--- a/package/pcmcia/pcmcia.mk
+++ /dev/null
@@ -1,114 +0,0 @@
-#############################################################
-#
-# pcmcia card services
-#
-#############################################################
-# Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Library General Public License as
-# published by the Free Software Foundation; either version 2 of the
-# License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# Library General Public License for more details.
-#
-# You should have received a copy of the GNU Library General Public
-# License along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
-# USA
-
-PCMCIA_SOURCE:=pcmcia-cs-3.2.7.tar.gz
-PCMCIA_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pcmcia-cs
-PCMCIA_DIR:=$(BUILD_DIR)/pcmcia-cs-3.2.7
-PCMCIA_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(PCMCIA_SOURCE):
-	$(call DOWNLOAD,$(PCMCIA_SITE),$(PCMCIA_SOURCE))
-
-pcmcia-source: $(DL_DIR)/$(PCMCIA_SOURCE)
-
-$(PCMCIA_DIR)/.unpacked: $(DL_DIR)/$(PCMCIA_SOURCE)
-	$(PCMCIA_CAT) $(DL_DIR)/$(PCMCIA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(PCMCIA_DIR)/.unpacked
-
-$(PCMCIA_DIR)/.patched: $(PCMCIA_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(PCMCIA_DIR) package/pcmcia/ pcmcia\*.patch
-	touch $(PCMCIA_DIR)/.patched
-
-$(PCMCIA_DIR)/.configured: $(PCMCIA_DIR)/.patched
-	( cd $(PCMCIA_DIR); ./Configure --kernel=$(LINUX26_DIR) --noprompt \
-		--rcdir=/etc --arch=$(ARCH) --trust --srctree --nocardbus \
-		--sysv --kcc=$(TARGET_CROSS)gcc --ucc="$(TARGET_CC)" --ld=$(TARGET_CROSS)ld \
-		--target=$(TARGET_DIR))
-	$(SED) "s/pump/udhcpc/" $(PCMCIA_DIR)/etc/network
-	$(SED) "s/ide_cs/ide-cs/" $(PCMCIA_DIR)/etc/config
-	$(SED) "s/bind \"wvlan_cs\"/bind \"orinoco_cs\"/g" $(PCMCIA_DIR)/etc/config
-	touch $(PCMCIA_DIR)/.configured
-
-$(PCMCIA_DIR)/cardmgr/cardmgr: $(PCMCIA_DIR)/.configured
-	$(MAKE) -C $(PCMCIA_DIR) -i all
-	-A=`find $(PCMCIA_DIR) -type f -perm +111`; \
-	for fo in $$A; do \
-		file $$fo | grep "ELF" | grep "executable" > /dev/null 2>&1; \
-		if [ $$? = 0 ]; then \
-			$(STRIPCMD) $$fo; \
-		fi; \
-	done
-	touch -c $(PCMCIA_DIR)/cardmgr/cardmgr
-
-$(TARGET_DIR)/sbin/cardmgr: $(PCMCIA_DIR)/cardmgr/cardmgr
-	rm -rf $(TARGET_DIR)/etc/pcmcia
-	$(MAKE) -i -C $(PCMCIA_DIR) install
-	rm -rf $(TARGET_DIR)/usr/man
-	rm -rf $(TARGET_DIR)/usr/share/man
-	rm -rf $(TARGET_DIR)/usr/X11R6/man
-	rm -rf $(TARGET_DIR)/etc/rc.d
-	rm -rf $(TARGET_DIR)/etc/rc?.d
-	rm -f $(TARGET_DIR)/etc/init.d/pcmcia*
-	rm -f $(TARGET_DIR)/sbin/dump_cis $(TARGET_DIR)/sbin/pack_cis
-	rm -f $(TARGET_DIR)/usr/share/pnp.ids $(TARGET_DIR)/sbin/lspnp $(TARGET_DIR)/sbin/setpnp
-	rm -f $(TARGET_DIR)/sbin/pcinitrd
-	rm -f $(TARGET_DIR)/sbin/probe
-	rm -f $(TARGET_DIR)/sbin/ide_info
-	rm -f $(TARGET_DIR)/sbin/scsi_info
-	rm -f $(TARGET_DIR)/sbin/ftl_check
-	rm -f $(TARGET_DIR)/sbin/ftl_format
-	rm -f $(TARGET_DIR)/usr/X11R6/bin/xcardinfo
-	rm -rf $(TARGET_DIR)/etc/sysconfig
-	mkdir -p $(TARGET_DIR)/etc/default
-	cp -f $(PCMCIA_DIR)/etc/pcmcia $(TARGET_DIR)/etc/default/
-	cp -f $(PCMCIA_DIR)/etc/rc.pcmcia $(TARGET_DIR)/etc/init.d/S30pcmcia
-	rm -rf $(TARGET_DIR)/etc/pcmcia/cis
-	chmod a+x $(TARGET_DIR)/etc/init.d/S30pcmcia
-	chmod -R u+w $(TARGET_DIR)/etc/pcmcia/*
-
-# use busybox depmod.pl so we need the sources unpacked
-$(PCMCIA_DIR)/.modules.dep: $(BUSYBOX_DIR)/.configured $(TARGET_DIR)/lib/modules
-	[ -d $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION) ] && \
-	$(BUSYBOX_DIR)/examples/depmod.pl \
-		-b $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/ \
-		-F $(LINUX26_DIR)/System.map \
-		> $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
-	touch $(PCMCIA_DIR)/.modules.dep
-
-pcmcia: linux26 $(TARGET_DIR)/sbin/cardmgr $(PCMCIA_DIR)/.modules.dep
-
-pcmcia-clean:
-	rm -f $(TARGET_DIR)/sbin/cardmgr
-	-$(MAKE) -C $(PCMCIA_DIR) clean
-	rm -f $(PCMCIA_DIR)/.configured $(PCMCIA_DIR)/config.out
-
-pcmcia-dirclean:
-	rm -rf $(PCMCIA_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PCMCIA),y)
-TARGETS+=pcmcia
-endif
diff --git a/package/pcmcia/pcmcia.patch b/package/pcmcia/pcmcia.patch
deleted file mode 100644
index 121435f..0000000
--- a/package/pcmcia/pcmcia.patch
+++ /dev/null
@@ -1,123 +0,0 @@
---- pcmcia-cs-3.1.34/etc/config.opts.orig	Tue Jul  9 09:36:23 2002
-+++ pcmcia-cs-3.1.34/etc/config.opts	Tue Jul  9 09:37:47 2002
-@@ -5,7 +5,7 @@
- 
- # System resources available for PCMCIA devices
- 
--include port 0x100-0x4ff, port 0x800-0x8ff, port 0xc00-0xcff
-+include port 0x100-0x4ff, port 0xc00-0xcff
- include memory 0xc0000-0xfffff
- include memory 0xa0000000-0xa0ffffff, memory 0x60000000-0x60ffffff
- 
-diff -urN pcmcia-cs-3.2.3.orig/etc/shared pcmcia-cs-3.2.3/etc/shared
---- pcmcia-cs-3.2.3.orig/etc/shared	2002-08-18 21:21:11.000000000 -0600
-+++ pcmcia-cs-3.2.3/etc/shared	2003-02-14 05:05:07.000000000 -0700
-@@ -2,6 +2,8 @@
- # shared 1.31 2002/08/19 03:21:11 (David Hinds)
- #
- 
-+umask 022
-+
- usage ()
- {
-     echo "usage: $0 [action] [device name]"
---- /dev/null	2003-01-21 22:14:35.000000000 -0700
-+++ pcmcia-cs-3.2.4/etc/pcmcia	2003-06-09 12:04:02.000000000 -0600
-@@ -0,0 +1,6 @@
-+# Defaults for pcmcia (sourced by /etc/init.d/S30pcmcia)
-+PCMCIA=yes
-+PCIC=yenta_socket
-+PCIC_OPTS=
-+CORE_OPTS=
-+CARDMGR_OPTS=
---- pcmcia-cs-3.2.4/etc/rc.pcmcia.orig	2002-08-08 00:43:43.000000000 -0600
-+++ pcmcia-cs-3.2.4/etc/rc.pcmcia	2003-06-09 15:17:28.000000000 -0600
-@@ -4,6 +4,8 @@
- #
- # This is designed to work in BSD as well as SysV init setups.  See
- # the HOWTO for customization instructions.
-+# Modified to comply with Debian's standards by Brian Mays
-+# <brian@debian.org>.
- 
- # Tags for Red Hat init configuration tools
- #
-@@ -26,9 +28,9 @@
- done
- 
- # Source PCMCIA configuration, if available
--if [ -f /etc/pcmcia.conf ] ; then
-+if [ -f /etc/default/pcmcia ] ; then
-     # Debian startup option file
--    . /etc/pcmcia.conf
-+    . /etc/default/pcmcia
- elif [ -f /etc/sysconfig/pcmcia ] ; then
-     # Red Hat startup option file
-     . /etc/sysconfig/pcmcia
-@@ -50,9 +52,22 @@
- done
- if [ "$PCMCIA" -a "$PCMCIA" != "yes" ] ; then exit 0 ; fi
- 
-+# Debian modification: Fix PCIC for stand-alone modules.
-+# yenta_socket -> i82365 on these systems.
-+# Existence of a standalone module implies that it is preferred.
-+if [ -d /lib/modules/preferred ] ; then
-+    PC=/lib/modules/preferred/pcmcia
-+else
-+    PC=/lib/modules/`uname -r`/pcmcia
-+fi
-+if [ "$PCIC" = yenta_socket -a -e $PC/i82365.o \
-+    -a ! -L $PC/i82365.o ]; then
-+    PCIC=i82365
-+fi
-+
- usage()
- {
--    echo "Usage: $0 {start|stop|status|restart|reload}"
-+    echo "Usage: $0 {start|stop|status|restart|reload|force-reload}"
- }
- 
- cleanup()
-@@ -84,7 +99,7 @@
- 	    SC=/var/lib/pcmcia/scheme
- 	    RUN=/var/lib/pcmcia
- 	else
--	    SC=/var/run/pcmcia-scheme
-+	    SC=/var/lib/misc/pcmcia-scheme
- 	    RUN=/var/run
- 	fi
- 	if [ -L $SC -o ! -O $SC ] ; then rm -f $SC ; fi
-@@ -154,7 +172,7 @@
- 	;;
- 
-     status)
--	pid=`/sbin/pidof cardmgr`
-+	pid=`/bin/pidof cardmgr`
- 	if [ "$pid" != "" ] ; then
- 	    echo "cardmgr (pid $pid) is running..."
- 	    EXITCODE=0
-@@ -164,12 +182,18 @@
- 	fi
- 	;;
- 
--    restart|reload)
-+    restart)
- 	$0 stop
- 	$0 start
- 	EXITCODE=$?
- 	;;
- 
-+    reload|force-reload)
-+	echo "Reloading $DESC configuration files."
-+	kill -1 `cat /var/run/cardmgr.pid` 2>/dev/null
-+	EXITCODE=0
-+	;;
-+
-     *)
- 	usage
- 	;;
-@@ -179,4 +203,4 @@
- done
- 
- # Only exit if we're in our own subshell
--case $0 in *rc.pcmcia) exit $EXITCODE ;; esac
-+case $0 in *pcmcia) exit $EXITCODE ;; esac
-- 
1.7.0.4
