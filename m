From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 20:45:01 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/logrotate: fix
 legal-info
Message-ID: <20190624184404.AACB482283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbbabb1cb3a84849d611493b461e68e388e7bde5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add hash for COPYING file

Fixes:

$: make logrotate-legal-info
 >>> logrotate 3.15.0 Collecting legal info
 ERROR: No hash found for COPYING

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 38626b4b63bf877c3cfeb356a4b0dc0e79bdbc75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/logrotate/logrotate.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 70b068c67f..bebbd74657 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 fb1ff8502e7ae4aedaa3d0da8d3740a6a0f44b72e34666af724e9094b166c942  logrotate-3.13.0.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
