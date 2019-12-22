From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:28:19 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] DEVELOPERS: add me as a
 maintainer for the NETCONF stack
Message-ID: <20191222204328.222AB8D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4c84b6caf4cf13b4379f655f848e7449c306a25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

We've been using libyang, sysrepo, libnetconf2 and the Netopeer2 suite
of software for more than two years, so let's make this official.

Signed-off-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 603f8f124f705af20c48d38312cfc719e98ba472)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c80a21af7..bca1b578a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1152,6 +1152,9 @@ F:	configs/orangepi_lite_defconfig
 N:	Jan Kundr??t <jan.kundrat@cesnet.cz>
 F:	configs/solidrun_clearfog_defconfig
 F:	board/solidrun/clearfog/
+F:	package/libnetconf2/
+F:	package/libyang/
+F:	package/sysrepo/
 
 N:	Jan Pedersen <jp@jp-embedded.com>
 F:	package/zip/
