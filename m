From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 23:10:54 +0200
Subject: [Buildroot] [PATCH 1/5] download/git: fix code-style
In-Reply-To: <cover.1534972250.git.yann.morin.1998@free.fr>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
Message-ID: <b1b9518e481aaf3efffea2d6a269041af0c9ae07.1534972250.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This file uses leading spaces, not TABs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

---
;-)
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 11bb52c1e1..17ca04eb98 100755
--- a/support/download/git
+++ b/support/download/git
@@ -185,7 +185,7 @@ fi
 # the state of the remote server. It also would generate large tarballs
 # (gigabytes for some linux trees) when a full clone took place.
 find . -not -type d \
-	-and -not -path "./.git/*" >"${output}.list"
+       -and -not -path "./.git/*" >"${output}.list"
 LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
 
 # Create GNU-format tarballs, since that's the format of the tarballs on
-- 
2.14.1
