From: Sebastien Roy <sebastien.roy@savoirfairelinux.com>
Date: Thu, 29 May 2014 11:09:32 -0400
Subject: [Buildroot] [PATCH 1/1]  manual: Fix BR2_GLOBAL_PATCH_DIR example
Message-ID: <1401376172-27514-1-git-send-email-sebastien.roy@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    As discussed on irc, there is a missing part in the BR2_GLOBAL_PATCH_DIR
    example compared to the ASCII figure under customize-packages section.

Signed-off-by: Sebastien Roy <sebastien.roy@savoirfairelinux.com>
---
 docs/manual/customize-packages.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
index 6f70bdb..b4ed0b5 100644
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-packages.txt
@@ -86,7 +86,7 @@ If the user has the +BR2_GLOBAL_PATCH_DIR+ configuration option set as
 follows:
 
 -----
-BR2_GLOBAL_PATCH_DIR="board/common-fooarch board/fooarch-board"
+BR2_GLOBAL_PATCH_DIR="board/common-fooarch/patches board/fooarch-board/patches"
 -----
 
 Then the patches would applied as follows for the Linux kernel:
-- 
1.9.3
