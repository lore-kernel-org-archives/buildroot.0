From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Date: Wed, 22 Aug 2018 15:35:00 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Juno ARM maintainer
Message-ID: <397868181394a89dad65a94a8f7ea68c88e45d36.1534944883.git.gustavo.pimentel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a6d76dd..7b4ae55 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -865,6 +865,10 @@ F:	arch/Config.in.csky
 F:	board/csky/
 F:	configs/csky_*
 
+N:	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
+F:	configs/arm_juno_defconfig
+F:	board/arm/juno/
+
 N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 F:	package/gnuradio/
 F:	package/gqrx/
-- 
2.7.4
