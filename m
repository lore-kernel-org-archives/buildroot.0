From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 4 Dec 2019 11:17:27 +0100
Subject: [Buildroot] [PATCH 7/7] Add me as a maintainer for the NETCONF stack
In-Reply-To: <cover.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <ec0bebfefa272b6535ca451f6a3fc9beb80681ee.1575456104.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We've been using libyang, sysrepo, libnetconf2 and the Netopeer2 suite
of software for more than two years, so let's make this official.

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a1f94df951..7dc318f013 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1165,6 +1165,9 @@ F:	configs/orangepi_lite_defconfig
 N:	Jan Kundr?t <jan.kundrat@cesnet.cz>
 F:	configs/solidrun_clearfog_defconfig
 F:	board/solidrun/clearfog/
+F:	package/libnetconf2/
+F:	package/libyang/
+F:	package/sysrepo/
 
 N:	Jan Pedersen <jp@jp-embedded.com>
 F:	package/zip/
-- 
2.21.0
