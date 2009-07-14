From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Jul 2009 20:59:51 -0400
Subject: [Buildroot] [git commit] .gitignore: add backup files
Message-ID: <20090718062011.1856077827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b09d8a72d2efe07bf996406deff5ded22652046f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Add *.orig and *~ backup files to gitignore.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .gitignore |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index e7117d3..93b53bb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -9,3 +9,5 @@
 /.config
 *.depend
 *.o
+*.orig
+*~
-- 
1.6.3.3
