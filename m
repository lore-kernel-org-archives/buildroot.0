From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 10:28:12 +0100
Subject: [Buildroot] [git commit] package/zd1211-firmware: add an upstream
 URL to Config.in
Message-ID: <20191229091905.B0FE18E59E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1ba6d391b7e5a235c263d414403f150c9583fc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zd1211-firmware/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zd1211-firmware/Config.in b/package/zd1211-firmware/Config.in
index 4469533b0a..807c26f536 100644
--- a/package/zd1211-firmware/Config.in
+++ b/package/zd1211-firmware/Config.in
@@ -2,3 +2,5 @@ config BR2_PACKAGE_ZD1211_FIRMWARE
 	bool "zd1211-firmware"
 	help
 	  Firmware for the ZyDAS ZD1211 / Atheros AR5007UG wifi devices.
+
+	  https://sourceforge.net/projects/zd1211/
