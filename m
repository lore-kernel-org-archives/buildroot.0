From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Oct 2016 21:58:30 +0200
Subject: [Buildroot] [PATCH] core/br2-external: fix link to manual for
	converting old trees
Message-ID: <1476907110-32195-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be noted: that link will only be valid once we have a released
manual. In the meantime, it's accessible on the nightly manual:
    http://nightly.buildroot.org/#br2-external-converting

Reported-by: Beno?t Allard <benoit.allard@greenbone.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Beno?t Allard <benoit.allard@greenbone.net>
---
 support/scripts/br2-external | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 848c851..055dc08 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -8,7 +8,7 @@ declare -A BR2_EXT_DESCS
 
 # URL to manual for help in converting old br2-external trees.
 # Escape '#' so that make does not consider it a comment.
-MANUAL_URL='https://buildroot.org/manual/manual.html\#br2-external-converting'
+MANUAL_URL='https://buildroot.org/manual.html\#br2-external-converting'
 
 main() {
     local OPT OPTARG
-- 
2.7.4
