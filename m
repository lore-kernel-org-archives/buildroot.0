From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 22:44:26 +0200
Subject: [Buildroot] [git commit] download/git: fix code-style
Message-ID: <20180910204332.F3FB783C76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63a0593566451c0f3a623fe069cb679cd1deb9dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This file uses leading spaces, not TABs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
