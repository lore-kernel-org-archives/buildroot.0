From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Apr 2021 21:11:26 +0200
Subject: [Buildroot] [git commit] package/skalibs: Fix license hash after
 bump to version 2.10.0.2
Message-ID: <20210407185256.8463281640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=965bf9e0ca736df748ff7652105c995b5fff5a5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to year change.

Commit 4d5587cb56224b2b28f53b0202fb14b2ab32d5fb was accidentally based
on v1 of this patch.

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/skalibs/skalibs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index cb563d3cc5..2e486ea901 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
 sha256 8bba3d7650bab83d4ea2ad21d6bfb5479a8652e362a478fcb783b3c7cf891e0f  skalibs-2.10.0.2.tar.gz
-sha256 5443ac67e8d74ac614ced7bc64211ce90ccedb7778a68bfe9e68a8b234c9503e  COPYING
+sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
