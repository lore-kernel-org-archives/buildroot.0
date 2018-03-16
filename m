From: Martin Bark <martin@barkynet.com>
Date: Fri, 16 Mar 2018 18:02:32 +0000
Subject: [Buildroot] [PATCH v3 7/7] DEVELOPERS: add myself for rpi packages
In-Reply-To: <20180316180232.18829-1-martin@barkynet.com>
References: <20180316180232.18829-1-martin@barkynet.com>
Message-ID: <20180316180232.18829-8-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changed v2 -> v3
 - new in v3
---
 DEVELOPERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3df820e712..76c783c03a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1131,9 +1131,14 @@ F:	package/harfbuzz/
 F:	package/libsecret/
 
 N:	Martin Bark <martin@barkynet.com>
+F:	board/raspberrypi/
+F:	configs/raspberrypi3_defconfig
 F:	package/ca-certificates/
 F:	package/connman/
 F:	package/nodejs/
+F:	package/rpi-bt-firmware/
+F:	package/rpi-firmware/
+F:	package/rpi-wifi-firmware/
 F:	package/tzdata/
 F:	package/zic/
 
-- 
2.16.2
