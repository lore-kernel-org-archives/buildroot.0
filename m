From: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Mon,  1 Jan 2018 16:39:32 +0000
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: Add myself to mpv & others
Message-ID: <20180101163932.7341-1-mahyar.koshkouei@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Additionally added myself to ffmpeg, rpi-firmware and rpi-userland as
changes to mpv may require updates or other changes to these packages
and vice-versa.

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8e3e6b1545..28beff618c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1029,6 +1029,12 @@ F:	package/python-simplejson/
 F:	package/python-versiontools/
 F:	package/wilc1000-firmware/
 
+N:	Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
+F:	package/ffmpeg/
+F:	package/mpv/
+F:	package/rpi-firmware/
+F:	package/rpi-userland/
+
 N:	Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
 F:	package/nvme/
 
-- 
2.15.1
