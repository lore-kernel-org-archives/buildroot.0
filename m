From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Thu,  5 Jan 2017 20:27:09 +0100
Subject: [Buildroot] [PATCH 1/1] docs: Add bc to required tools.
Message-ID: <20170105192709.29145-1-m.hoffmann@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We check for bc under required packages. It should be listed as such in the docs.

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
---
 docs/manual/prerequisite.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index ac0ab62..110fab4 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -36,6 +36,7 @@ between distributions).
 ** +unzip+
 ** +rsync+
 ** +file+ (must be in +/usr/bin/file+)
+** +bc+
 
 * Source fetching tools:
 ** +wget+
-- 
2.9.3
