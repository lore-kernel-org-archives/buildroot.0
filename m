From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:18:37 +0200
Subject: [Buildroot] [PATCH 28/28] package/rpi-bt-firmware: add hash
In-Reply-To: <20170611081837.23863-1-bernd.kuhls@t-online.de>
References: <20170611081837.23863-1-bernd.kuhls@t-online.de>
Message-ID: <20170611081837.23863-28-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/rpi-bt-firmware/rpi-bt-firmware.hash

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
new file mode 100644
index 000000000..f1d06e8ca
--- /dev/null
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 5d9c9364277414ffd67b4a266cdf88e92f28eb937e5a413750e87b7a94161bef  rpi-bt-firmware-a439f892bf549ddfefa9ba7ad1999cc515f233bf.tar.gz
-- 
2.11.0
