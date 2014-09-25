From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Sep 2014 09:59:13 -0300
Subject: [Buildroot] [PATCH] gnuplot: update hashes
Message-ID: <1411649953-26655-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gnuplot 4.6.6 tarball was updated because of this:
(based on a diff from the original release and the updated one)
http://thread.gmane.org/gmane.comp.graphics.gnuplot.user/7856

Update hashes accordingly, but really this is all kinds of bad.
Fixes:
http://autobuild.buildroot.net/results/925/925fc731e404282873f2c586c98b05da5ce96ae7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnuplot/gnuplot.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index 6898e90..37cc3e7 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/gnuplot/files/gnuplot/4.6.6/
-md5	9c541f553c2491c56fc8b6126ff4ff73	gnuplot-4.6.6.tar.gz
-sha1	53802f565a87a6d5044d0b9c2422b5eb905d1d45	gnuplot-4.6.6.tar.gz
+md5	02a980b37ba181f7510816ed6440c9c1	gnuplot-4.6.6.tar.gz
+sha1	012bd22b7be32da186b6bb015c0c6d876926c90b	gnuplot-4.6.6.tar.gz
-- 
1.8.5.5
