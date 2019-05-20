From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 20 May 2019 21:32:23 +0200
Subject: [Buildroot] [RFC PATCH 4/4] board/lemaker/bananapro/rootfs_overlay:
 add symlink for brcmfmac43362-sdio file
In-Reply-To: <20190520193223.14071-1-b.bilas@grinn-global.com>
References: <20190520193223.14071-1-b.bilas@grinn-global.com>
Message-ID: <20190520193223.14071-4-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes following error:
     brcmfmac mmc1:0001:1: Direct firmware load for
     brcm/brcmfmac43362-sdio.lemaker,bananapro.txt failed with error -2

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 .../lib/firmware/brcm/brcmfmac43362-sdio.lemaker,bananapro.txt   | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.lemaker,bananapro.txt

diff --git a/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.lemaker,bananapro.txt b/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.lemaker,bananapro.txt
new file mode 120000
index 0000000000..93947975ee
--- /dev/null
+++ b/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.lemaker,bananapro.txt
@@ -0,0 +1 @@
+brcmfmac43362-sdio.txt
\ No newline at end of file
-- 
2.21.0
