From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 16 Oct 2010 16:46:44 -0400
Subject: [Buildroot] [git commit master 1/1] gitignore: add ..config.tmp
Message-ID: <20101016204702.8AA358D282@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9225c7ab96b8baf0fc1ab53fbb5408899ba3df71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 .gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index a736c4d..18588e8 100644
--- a/.gitignore
+++ b/.gitignore
@@ -3,6 +3,7 @@
 /.auto.deps
 /.config.cmd
 /.config.old
+/..config.tmp
 /.config
 *.depend
 *.o
-- 
1.7.1
