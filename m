From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:03:48 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add me as a maintainer for the
 NETCONF stack
Message-ID: <20191208215535.D20C288DD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=603f8f124f705af20c48d38312cfc719e98ba472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We've been using libyang, sysrepo, libnetconf2 and the Netopeer2 suite
of software for more than two years, so let's make this official.

Signed-off-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9eb62a2f83..61bcd99d43 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1168,6 +1168,9 @@ F:	configs/orangepi_lite_defconfig
 N:	Jan Kundr??t <jan.kundrat@cesnet.cz>
 F:	configs/solidrun_clearfog_defconfig
 F:	board/solidrun/clearfog/
+F:	package/libnetconf2/
+F:	package/libyang/
+F:	package/sysrepo/
 
 N:	Jan Pedersen <jp@jp-embedded.com>
 F:	package/zip/
