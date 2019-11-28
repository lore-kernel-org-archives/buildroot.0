From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 16:44:24 +0100
Subject: [Buildroot] [git commit] package/leafnode2: update the upstream URL
 in Config.in
Message-ID: <20191128154138.2172881784@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e8f2056eacbe516d6c3e9c8a316bd2989488054
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
