From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 23:07:06 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add Christophe Priouzeau as
 contact for STM32 defconfigs
Message-ID: <20190812211734.817478E8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7629b27207d3ea3fa90b94aa85905e0c6977bcc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Christophe has recently taken care of those defconfigs, so let's add
him as a contact for those defconfigs, so that he receives build
failure notifications and is Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Cc: Lee Jones <lee.jones@linaro.org>
Acked-by: Christophe Priouzeau <christophe.priouzeau@st.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9491713920..5b6005dc89 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -523,6 +523,12 @@ F:	package/rtl8821au/
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
