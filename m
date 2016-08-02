From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Aug 2016 22:35:47 +0200
Subject: [Buildroot] [git commit] readline: add project URL
Message-ID: <20160802203556.19D0D820F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1df4bd353d217530cc639ce58b3c5232d6933bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/readline/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/readline/Config.in b/package/readline/Config.in
index fbebf18..1cb0672 100644
--- a/package/readline/Config.in
+++ b/package/readline/Config.in
@@ -5,3 +5,5 @@ config BR2_PACKAGE_READLINE
 	  The GNU Readline library provides a set of functions for use
 	  by applications that allow users to edit command lines
 	  as they are typed in.
+
+	  https://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
