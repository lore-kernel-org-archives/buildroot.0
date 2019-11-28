From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 11:07:18 +0000
Subject: [Buildroot] [PATCH 1/1] package/leafnode2: update the upstream URL
 in Config.in
Message-ID: <20191128110718.17725-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/leafnode2/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafnode2/Config.in b/package/leafnode2/Config.in
index 93d3090a00..e244bdc45b 100644
--- a/package/leafnode2/Config.in
+++ b/package/leafnode2/Config.in
@@ -9,9 +9,9 @@ config BR2_PACKAGE_LEAFNODE2
 
 	  Leafnode-2 needs inetd, check chapter 14 of the documentation
 	  at:
-	  http://www.dt.e-technik.uni-dortmund.de/~ma/leafnode/beta/leafnode-readme.txt
+	  http://krusty.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta/leafnode-readme.txt
 
 	  For example, you can add this line to inetd.conf:
 	  nntp    stream  tcp     nowait  news    /usr/sbin/leafnode
 
-	  http://www.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta
+	  http://krusty.dt.e-technik.tu-dortmund.de/~ma/leafnode/beta
-- 
2.20.1
