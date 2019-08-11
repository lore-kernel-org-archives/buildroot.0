From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:22 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Christophe Priouzeau as contact
 for STM32 defconfigs
Message-ID: <20190811120739.26539-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christophe has recently taken care of those defconfigs, so let's add
him as a contact for those defconfigs, so that he receives build
failure notifications and is Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
Christophe, please reply with an Acked-by if you are OK with
this. Thanks!
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8ba6cd985..8995065c5f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -517,6 +517,12 @@ F:	package/rtl8821au/
 F:	package/runc/
 F:	package/tini/
 
+N:	Christophe Priouzeau <christophe.priouzeau@st.com>
+F:	board/stmicroelectronics/stm32f429-disco/
+F:	board/stmicroelectronics/stm32f469-disco/
+F:	configs/stm32f429_disco_defconfig
+F:	configs/stm32f469_disco_defconfig
+
 N:	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 F:	package/drbd-utils/
 F:	package/iotop/
-- 
2.21.0
