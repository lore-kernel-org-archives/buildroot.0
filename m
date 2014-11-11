From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 19:33:56 +0100
Subject: [Buildroot] [PATCH] docs/manual: cleanup github helper docs
Message-ID: <1415730836-14762-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly state that the github helper should not be used when there is
a release tarball.

Properly render the list by separating it from the previous paragraph.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/manual/adding-packages-tips.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 0c6018a..fb7f35a 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -61,10 +61,11 @@ may be slightly different (e.g. it contains a configure script so we don't
 need to do AUTORECONF).
 
 You can see on the release page if it's an uploaded tarball or a git tag:
+
 - If there is a green download button, like
   https://github.com/zedshaw/mongrel2/releases/tag/v1.9.1[mongrel2], then it
   was uploaded by the maintainer and you should use the link of that button to
-  specify +FOO_SITE+.
+  specify +FOO_SITE+, and not use the 'github' herlper.
 - If there is grey download button, like
   https://github.com/xbmc/xbmc/releases/tag/13.2-Gotham[xbmc], then it's an
   automatically generated tarball and you should use the 'github' helper
-- 
1.9.1
