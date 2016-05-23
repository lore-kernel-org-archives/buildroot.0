From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 May 2016 22:44:22 +0200
Subject: [Buildroot] [git commit] docs: Fixed syntax error in makedev-syntax
	example.
Message-ID: <20160523204702.7B6CF81E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caf4caa49b72de20dc3f60a4e4e53d11f747cfd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the makedev syntax documentation, one of the examples lacks the "mode"
value.  This patch fixes that example.

Signed-off-by: Alan Yaniger <alan@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
