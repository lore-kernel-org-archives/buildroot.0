From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2021 22:20:08 +0100
Subject: [Buildroot] [git commit] package/sysklogd: drop unneeded hash
Message-ID: <20210121210128.60AFB87113@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db523a784246c00bd36f718306475f54e5f1a6fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6a91580c1175b098fe2508ca11bfcf621ecbbe9f added the hash of
0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch but this
is not needed as this file is included in buildroot and not downloaded

While at it, update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysklogd/sysklogd.hash | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 9f9fd192e1..978a670d30 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-sha256	09fe1edca882a9ae976cdbf516786edc1629347b9507d45dc005d9d969f94702	sysklogd-2.1.2.tar.gz
-sha256	7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477	LICENSE
-sha256	569321607efe6ba0ecb820b3cb23d933e92f6ab50d2f8fcceb23fc8a43756ef0	0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
+sha256  09fe1edca882a9ae976cdbf516786edc1629347b9507d45dc005d9d969f94702  sysklogd-2.1.2.tar.gz
+sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
