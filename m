From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 10:54:55 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] DEVELOPERS: remove
 Jonathan Liu
Message-ID: <20191028094823.277438B4D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ec414a837aa3d254ec47e97a3008257ef09c289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

In a private e-mail answering one of our notifications about packages
being outdated, Jonathan replied:

"""
I switched from Buildroot to OpenEmbedded in 2013 so am no longer actively
involved with Buildroot.
Please unsubscribe me from outdated package notifications.
"""

So let's remove him from the DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 175c3f8b2dde867d878f5a1eb01e8317257efd20)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 13d46bcf5a..bfc7465f25 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1124,10 +1124,6 @@ F:	package/phidgetwebservice/
 F:	package/rapidxml/
 F:	package/sphinxbase/
 
-N:	Jonathan Liu <net147@gmail.com>
-F:	package/python-meld3/
-F:	package/supervisor/
-
 N:	J??rg Krause <joerg.krause@embedded.rocks>
 F:	board/lemaker/bananapro/
 F:	configs/bananapro_defconfig
