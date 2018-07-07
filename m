From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 7 Jul 2018 23:31:48 +0200
Subject: [Buildroot] [git commit] liblogging: update project URL
Message-ID: <20180707213041.2FC2B87784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d1d513c65a17003f695a8aeea9d686f28456a44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original site www.liblogging.org has been taken down because of the
new European data protection regulation (GDPR), to which it was not
compliant.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/liblogging/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liblogging/Config.in b/package/liblogging/Config.in
index 23c3c1ad2d..a39fdf8ddc 100644
--- a/package/liblogging/Config.in
+++ b/package/liblogging/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBLOGGING
 	  logging. It offers an enhanced replacement
 	  for the syslog() call, but retains its ease of use.
 
-	  http://www.liblogging.org/
+	  https://www.rsyslog.com/liblogging/
