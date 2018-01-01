From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 23:01:38 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: Add myself to mpv & others
Message-ID: <20180101220144.2977F834E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5950d868b293baa21452fe40d7e0f4d0d27af1dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Additionally added myself to ffmpeg, rpi-firmware and rpi-userland as
changes to mpv may require updates or other changes to these packages
and vice-versa.

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8e3e6b1..28beff6 100644
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
 
