From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 15 Oct 2010 17:17:40 -0400
Subject: [Buildroot] [PATCH] gitignore: add ..config.tmp
Message-ID: <1287177460-15599-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.3.1
