From: Jan Kraval <jan.kraval@gmail.com>
Date: Mon, 11 Jun 2018 19:01:13 +0200
Subject: [Buildroot] [PATCH 2/2] configs/orangepi_lite: Enable HDMI and
 analog audio in Linux config
In-Reply-To: <20180611170113.9305-1-jan.kraval@gmail.com>
References: <20180611170113.9305-1-jan.kraval@gmail.com>
Message-ID: <20180611170113.9305-2-jan.kraval@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
---
 board/orangepi/orangepi-lite/linux-extras.config | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/board/orangepi/orangepi-lite/linux-extras.config b/board/orangepi/orangepi-lite/linux-extras.config
index 5e3af2b831..6bb716903f 100644
--- a/board/orangepi/orangepi-lite/linux-extras.config
+++ b/board/orangepi/orangepi-lite/linux-extras.config
@@ -6,3 +6,10 @@ CONFIG_CFG80211_WEXT=y
 
 # wireless drivers
 CONFIG_WLAN=y
+
+# hdmi
+CONFIG_DRM_SUN8I_DW_HDMI=y
+CONFIG_SUN8I_DE2_CCU=y
+
+# analog audio
+CONFIG_SND_SUN8I_CODEC_ANALOG=y
-- 
2.11.0
