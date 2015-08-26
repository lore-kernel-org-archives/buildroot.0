From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Aug 2015 22:17:01 +0200
Subject: [Buildroot] [PATCH] docs/website: fix manual symlink
Message-ID: <1440620221-30512-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/website/manual.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/manual.html b/docs/website/manual.html
index bd5552e..0c2c818 120000
--- a/docs/website/manual.html
+++ b/docs/website/manual.html
@@ -1 +1 @@
-/downloads/manual/manual.html
\ No newline at end of file
+/var/www/downloads/buildroot/manual/manual.html
\ No newline at end of file
-- 
1.9.1
