From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 16 Nov 2012 07:13:32 +0100
Subject: [Buildroot] [PATCH 1/2] manual: prerequisite.txt: add texinfo to
	the mandatory package list
Message-ID: <1353046413-3015-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the internal Buildroot toolchain backend, makeinfo, whom belongs to
the texinfo package, is required to build gcc and gdb.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/prerequisite.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 693347b..31d437d 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -42,6 +42,7 @@ Mandatory packages
 ** +python+ (version 2.6 or 2.7)
 ** +unzip+
 ** +rsync+
+** +texinfo+ (required for internal Buildroot toolchain backend)
 
 * Source fetching tools:
 ** +wget+
-- 
1.8.0
