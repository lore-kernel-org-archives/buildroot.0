From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 13:18:00 +0200
Subject: [Buildroot] [git commit] package/logrotate: fix legal-info
Message-ID: <20190619112006.1D2DE80FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38626b4b63bf877c3cfeb356a4b0dc0e79bdbc75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for COPYING file

Fixes:

$: make logrotate-legal-info
 >>> logrotate 3.15.0 Collecting legal info
 ERROR: No hash found for COPYING

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/logrotate/logrotate.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index d83f69f194..b147405197 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 011b9e2c7dc785f702f960dc15b7871bd46e53a9a6e336299e4f3d22022986fd  logrotate-3.15.0.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
