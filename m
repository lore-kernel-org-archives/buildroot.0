From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Jul 2009 16:40:00 +0200
Subject: [Buildroot] [git commit] target/Makefile.in: remove hurd reference
Message-ID: <20090726144048.EE94B777FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1f359c2fe0c639488887cb861f56ecc5b719c939
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missed by b6192fb9752a.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Makefile.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/target/Makefile.in b/target/Makefile.in
index ff0f6b5..a835353 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -84,5 +84,3 @@ include target/linux/Makefile.in.advanced
 endif
 
 include target/device/Makefile.in.linux
-
-include target/hurd/Makefile.in
-- 
1.6.3.3
