From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 22 Apr 2017 13:59:44 +0200
Subject: [Buildroot] [PATCH v8 01/12] e2fsprogs: change upstream URL sf.net
	-> sourceforge.net
In-Reply-To: <20170422115955.22718-1-arnout@mind.be>
References: <20170422115955.22718-1-arnout@mind.be>
Message-ID: <20170422115955.22718-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

sf.net redirects to sourceforge.net, so directly use that as upstream
URL. Config.in.host already uses that URL.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Arnout: remove trailing /]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index d1914a9953..da6aacf2fd 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_E2FSPROGS
 	help
 	  The EXT2 file system utilities.
 
-	  http://e2fsprogs.sf.net
+	  http://e2fsprogs.sourceforge.net
 
 if BR2_PACKAGE_E2FSPROGS
 
-- 
2.11.0
