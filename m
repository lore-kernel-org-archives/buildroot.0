From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 09:03:16 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: remove Jonathan Liu
Message-ID: <20191008065817.D30E18B56D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=175c3f8b2dde867d878f5a1eb01e8317257efd20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a private e-mail answering one of our notifications about packages
being outdated, Jonathan replied:

"""
I switched from Buildroot to OpenEmbedded in 2013 so am no longer actively
involved with Buildroot.
Please unsubscribe me from outdated package notifications.
"""

So let's remove him from the DEVELOPERS file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d93973041..ddb4408631 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1237,10 +1237,6 @@ F:	package/phidgetwebservice/
 F:	package/rapidxml/
 F:	package/sphinxbase/
 
-N:	Jonathan Liu <net147@gmail.com>
-F:	package/python-meld3/
-F:	package/supervisor/
-
 N:	Joris Offouga <offougajoris@gmail.com>
 F:	package/python-colorlog/
 F:	package/python-simplelogging/
