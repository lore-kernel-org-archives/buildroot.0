From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 22:15:33 +0200
Subject: [Buildroot] [git commit] CHANGES: update with list of issues fixed
 in 2020.05-rc1
Message-ID: <20200507200007.B9B3690EDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e7bb67fc8dbdd0cea9effff077e262fbc607f00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5a2f2d20fd..75d3f61232 100644
--- a/CHANGES
+++ b/CHANGES
@@ -59,6 +59,24 @@
 	nanopi_neo4, nanopi_r1, nitrogen8mm, nitrogen8mn, olpc_xo1,
 	olpc_xo175, roc_rk3399_pc, stm32mp157a_dk1, zynq_qmtech
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10386: Add an option to put all compiled executables that
+		show up on target/ in staging/ as well
+	#11866: iniramfs file system fails to boot using  Grub on EFI x86_64
+	#12666: Doesn't pick up a custom bash profile
+	#12696: Uboot 2020.01 Problem loading Linux kernel  on Nano PI NEO
+	#12701: [patch] wpa_supplicant must depend on  openssl
+	#12711: host-localedef 2.30-20 fails to compile on  fedora 32 (gcc 10.0.1)
+	#12716: bio.h not found
+	#12726: systemctl preset-all failed for	 ctrl-alt-del.target
+	#12731: rtl8188eu not buildung for banana pi M1	 (glib, systemd, 4.18.12)
+	#12746: "sysdig" package description points to
+		http://sysdig.org, which bounces to malware site
+	#12751: OpenJdk package installation issues on	target
+	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
+	#12811: bootstrap stuck and no login prompt
+
 2020.02.1, released April 10th, 2020
 
 	Important / security related fixes.
