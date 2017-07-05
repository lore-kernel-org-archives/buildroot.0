From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:32 +0200
Subject: [Buildroot] [git commit] mfgtools: remove host/usr reference from
	readme.txt
Message-ID: <20170705141336.5324681D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=884d1ec994513dad68d72fe1c92c47ad7012b2ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mfgtools/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mfgtools/readme.txt b/package/mfgtools/readme.txt
index d54781f..320e6ec 100644
--- a/package/mfgtools/readme.txt
+++ b/package/mfgtools/readme.txt
@@ -42,7 +42,7 @@ Depending on your ucl2.xml file, the sample doesn't flash anything.
 
 6. Run the MfgTools client:
 
-$ ./host/usr/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
+$ ./host/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
   -s dtbname=imx6q-sabrelite.dtb -s initramfs=rootfs.cpio.uboot \
   -s mmc=1 -p 1
 
