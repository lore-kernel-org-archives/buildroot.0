From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 21:41:32 +0200
Subject: [Buildroot] [git commit] configs/orangepi_lite: Enable HDMI and
 analog audio in Linux config
Message-ID: <20180611194200.1DD7488285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7a445a58fac3adb5d5da2d3bbce649814646ab9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
