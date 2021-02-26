From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Feb 2021 22:44:21 +0100
Subject: [Buildroot] [git commit] package/libxcrypt: fix legal info
Message-ID: <20210308072136.3312E88918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a854214bdd822720a57cab1694519391fa24ff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the initial package has been submitted, the hashes for the
license files were computed against the files from the repository,
not the release tarball, but the files had changed in the repo
since the version was cut.

Fix that hash.

Fixes:
    http://autobuild.buildroot.net/results/206aac81799074ef45c0cc7b9979cbf02c3935d5
    http://autobuild.buildroot.net/results/8db5df1286673fdedb854bad2b9e5757d5218950

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[yann.morin.1998 at free.fr: expand commit log with root cause]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libxcrypt/libxcrypt.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index b56ab6beaf..d5d3710b71 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 sha256 7665168d0409574a03f7b484682e68334764c29c21ca5df438955a381384ca07  libxcrypt-4.4.17.tar.gz
-sha256 f8198fcc4f002bf54512bac2e68e1e3f04af7d105f4f4f98d7d22cb110e04715  LICENSING
+sha256 9178c76310a1136274d485e606ad92b6f8df265fc736642f5421d628214acc76  LICENSING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
