From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 21:30:19 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: drop entry for amd-catalyst
 package
Message-ID: <20180214203039.EF7D4887A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=647d9a2cdd230a5807f510936f9ae552a3dafd28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Romain Perier is no longer at Free Electrons, and his e-mail address
@free-electrons.com no longer exists, especially with the rename to
Bootlin. Romain is no longer maintaining the amd-catalyst package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c524cb6ac5..7c80790397 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1515,9 +1515,6 @@ F:	package/terminology/
 F:	package/upower/
 F:	package/xenomai/
 
-N:	Romain Perier <romain.perier@free-electrons.com>
-F:	package/amd-catalyst/
-
 N:	Ryan Barnett <ryan.barnett@rockwellcollins.com>
 F:	package/atftp/
 F:	package/miraclecast/
