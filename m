From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 18 Jun 2019 21:08:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/logrotate: fix legal-info
In-Reply-To: <1560884922-10439-1-git-send-email-pjtexier@koncepto.io>
References: <1560884922-10439-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <1560884922-10439-2-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for COPYING file

Fixes:

$: make logrotate-legal-info
 >>> logrotate 3.15.0 Collecting legal info
 ERROR: No hash found for COPYING

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/logrotate/logrotate.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index d83f69f..b147405 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 011b9e2c7dc785f702f960dc15b7871bd46e53a9a6e336299e4f3d22022986fd  logrotate-3.15.0.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-- 
2.7.4
