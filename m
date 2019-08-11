From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:29 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Rafal Susz as contact for
 s6lx9_microboard_defconfig
Message-ID: <20190811120739.26539-8-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rafal was the last person modifying this defconfig. Let's add him as
the contact for this defconfig, so that he receives build failure
notifications and gets Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Rafal Susz <rafal.susz@gmail.com>
---
Rafal, could you reply with an Acked-by, if you're fine with this?
Thanks!
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8b1ba6b643..51daa91d02 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1913,6 +1913,10 @@ F:	package/synergy/
 N:	Pranit Sirsat <Pranit.Sirsat@imgtec.com>
 F:	package/paho-mqtt-c/
 
+N:	Rafal Susz <rafal.susz@gmail.com>
+F:	board/avnet/s6lx9_microboard/
+F:	configs/s6lx9_microboard_defconfig
+
 N:	Rahul Bedarkar <rahulbedarkar89@gmail.com>
 F:	package/cxxtest/
 F:	package/gflags/
-- 
2.21.0
