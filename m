From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 09:01:06 +0200
Subject: [Buildroot] [git commit] kconfig: tell git to ignore new generated
	files
Message-ID: <20090731070133.7472977804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=33f13e393f55f12b3887cbf5c849fc14f8d7c666
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The update of kconfig and the addition of xconfig support generates
more files in package/config/. Tell git to ignore them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/config/.gitignore |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/config/.gitignore b/package/config/.gitignore
index 9067e68..161a19a 100644
--- a/package/config/.gitignore
+++ b/package/config/.gitignore
@@ -1,6 +1,10 @@
 /buildroot-config
 /conf
 /mconf
+/qconf
+/qconf.moc
+/.tmp_qtcheck
+/lkc_defs.h
 /lex.zconf.c
 /zconf.hash.c
 /zconf.tab.c
-- 
1.6.3.3
