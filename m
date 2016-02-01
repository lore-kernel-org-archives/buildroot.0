From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Feb 2016 15:25:30 +0100
Subject: [Buildroot] [PATCH] gitignore: ignore vim temporary files
Message-ID: <1454336730-18001-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index bb02d9f..346b5df 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,4 @@
 *.rej
 *~
 *.pyc
+*.swp
-- 
2.7.0
