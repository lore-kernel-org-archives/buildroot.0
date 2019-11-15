From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 23:37:40 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add Carlo Caione for jailhouse
Message-ID: <20191115223018.020798F0A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bb0691475702654868c7560eae02cf9cee61155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The jailhouse package was added in commit
ee4990721c14c624c99295598fde29e395647fb9 by Carlo Caione, but no entry
in the DEVELOPERS file was added. Let's fix this to ensure we have a
registered maintainer for the Jailhouse package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Carlo Caione <ccaione@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c0863aabc6..991be89849 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -461,6 +461,7 @@ N:	Brock Williams <brock@cottonwoodcomputer.com>
 F:	package/pdmenu/
 
 N:	Carlo Caione <carlo.caione@gmail.com>
+F:	package/jailhouse/
 F:	package/sunxi-boards/
 
 N:	Carlos Santos <unixmania@gmail.com>
