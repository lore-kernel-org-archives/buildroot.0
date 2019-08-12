From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 23:07:25 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add Rafal Susz as contact for
 s6lx9_microboard_defconfig
Message-ID: <20190812211734.A10FE8E8A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=424839af9959d31e4689eb6e0b95108978122e99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rafal was the last person modifying this defconfig. Let's add him as
the contact for this defconfig, so that he receives build failure
notifications and gets Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Rafal Susz <rafal.susz@gmail.com>
Acked-by: Rafal Susz <rafal.susz@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cd0c87f9b2..7e8e742247 100644
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
