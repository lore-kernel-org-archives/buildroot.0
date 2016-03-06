From: Alan Yaniger <alan@tkos.co.il>
Date: Sun,  6 Mar 2016 22:29:12 +0200
Subject: [Buildroot] [PATCH 2/2] docs: Fixed syntax error in makedev-syntax
	example. In the makedev syntax documentation,
	one of the examples lacks the "mode" value.
In-Reply-To: <1457296152-4047-1-git-send-email-alan@tkos.co.il>
References: <1457296152-4047-1-git-send-email-alan@tkos.co.il>
Message-ID: <1457296152-4047-4-git-send-email-alan@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alan Yaniger <alan@tkos.co.il>
---
 docs/manual/makedev-syntax.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index 0bbc16e..e4dffc9 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -44,7 +44,7 @@ this syntax, you will need to write:
 ----
 /usr/bin/foo f 755 0 0 - - - - -
 /usr/bin/bar f 755 root root - - - - -
-/data/buz f buz-user buz-group - - - - -
+/data/buz f 644 buz-user buz-group - - - - -
 ----
 
 Alternatively, if you want to change owner/permission of a directory
-- 
1.9.1
