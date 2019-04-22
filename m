From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:24:01 +0200
Subject: [Buildroot] [PATCH 05/12] supports/scripts: declare missing local
 variable
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <597e25ae25df488634b42ea4294fdfb1632f7146.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/br2-external | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index dfb3cc8bcc..a70e0159af 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -154,7 +154,7 @@ do_mk() {
 
 # Generate the kconfig snippet for the br2-external tree.
 do_kconfig() {
-    local br2_name br2_ext
+    local br2_name br2_desc br2_ext
 
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
-- 
2.14.1
