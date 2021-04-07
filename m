From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Apr 2021 21:13:03 +0200
Subject: [Buildroot] [git commit] package/execline: Fix license hash after
 bump to version 2.8.0.0
Message-ID: <20210407185256.990E8825B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86f7634bafdb50f144868149f5abe9c2e28550b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to year change.

Commit bf66772c9b089dfcd67e1abbe04d7db52562310a was accidentally based
on v1 of this patch.

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/execline/execline.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 935f5111f7..35ebc443b9 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
 sha256  e7744b4a400eda68b83dcfb1bce65e454606279882d83d8230ddf8afda25766d  execline-2.8.0.0.tar.gz
-sha256  5443ac67e8d74ac614ced7bc64211ce90ccedb7778a68bfe9e68a8b234c9503e  COPYING
+sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
