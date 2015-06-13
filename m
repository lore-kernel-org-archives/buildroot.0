From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Jun 2015 09:19:29 -0300
Subject: [Buildroot] [PATCH] sysstat: fix hash
Message-ID: <1434197969-7255-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix brainfail: mixed hash from dev and stable versions.
Fixes:
http://autobuild.buildroot.net/results/bdc/bdce55b88a4aaff82ce0a492a0a4f49ab5b9031b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysstat/sysstat.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index a170f81..f535b54 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,2 +1,2 @@
 # From http://sebastien.godard.pagesperso-orange.fr/download.html
-md5	4d8e6e72d057189a1660462a678d9ada	sysstat-11.0.5.tar.xz
+md5	438d607cd14357a24969633b9798d2be	sysstat-11.0.5.tar.xz
-- 
2.3.6
