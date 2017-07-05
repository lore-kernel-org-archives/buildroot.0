From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:35 +0200
Subject: [Buildroot] [PATCH v4 18/36] mfgtools: remove host/usr reference
	from readme.txt
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-19-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mfgtools/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mfgtools/readme.txt b/package/mfgtools/readme.txt
index d54781f1f9..320e6ec493 100644
--- a/package/mfgtools/readme.txt
+++ b/package/mfgtools/readme.txt
@@ -42,7 +42,7 @@ Depending on your ucl2.xml file, the sample doesn't flash anything.
 
 6. Run the MfgTools client:
 
-$ ./host/usr/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
+$ ./host/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
   -s dtbname=imx6q-sabrelite.dtb -s initramfs=rootfs.cpio.uboot \
   -s mmc=1 -p 1
 
-- 
2.13.2
