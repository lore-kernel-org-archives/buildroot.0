From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 10 Feb 2016 21:26:31 +0100
Subject: [Buildroot] [PATCH] skeleton: Recreate /var/run symlink
Message-ID: <1455135991-6491-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was the only one with a trailing slash, it's only for coherence's
sake.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 system/skeleton/var/run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/skeleton/var/run b/system/skeleton/var/run
index d1a2745..84ba55b 120000
--- a/system/skeleton/var/run
+++ b/system/skeleton/var/run
@@ -1 +1 @@
-../run/
\ No newline at end of file
+../run
\ No newline at end of file
-- 
2.7.0
