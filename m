From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu,  8 Mar 2018 06:29:07 -0800
Subject: [Buildroot] [PATCH 1/1] .gitignore: ignore outgoing directory
Message-ID: <20180308142907.3006-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The buildroot documentation for submitting patches creates a new
directory "outgoing".  This prevents git from nagging about untracked
files.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index bb02d9f572..f1a065d95e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,5 +1,6 @@
 /output
 /dl
+/outgoing
 /.auto.deps
 /.config.cmd
 /.config.old
-- 
2.14.3
