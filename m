From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 14:24:22 +0200
Subject: [Buildroot] [git commit] e2fsprogs: change upstream URL sf.net ->
	sourceforge.net
Message-ID: <20170422122426.AB8E1825CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ca015a1ad4a0292a645de9666952b7f834c2267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sf.net redirects to sourceforge.net, so directly use that as upstream
URL. Config.in.host already uses that URL.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Arnout: remove trailing /]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index d1914a9..da6aacf 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_E2FSPROGS
 	help
 	  The EXT2 file system utilities.
 
-	  http://e2fsprogs.sf.net
+	  http://e2fsprogs.sourceforge.net
 
 if BR2_PACKAGE_E2FSPROGS
 
