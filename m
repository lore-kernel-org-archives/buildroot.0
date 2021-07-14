From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 14 Jul 2021 10:28:55 +0200
Subject: [Buildroot] [git commit] package/rtl8189fs: correct hash
Message-ID: <20210714075913.5036190E6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fbeabd62012b5ce14dca2fcb9b6cf2d20419af0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While fixing up the spaces in the hash file of rtl8189fs in commit
5b88a0a57a9a590427d03719777c46f7ea5a6c43, Arnout accidentally removed a
digit of the hash. Fix that.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1422093322

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index ef040763a7..f42799b48e 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7d425e18ebc427b3df5ff31185b4dc29c6bfd54f8e167f57c2254cea341a26c  rtl8189fs-62c31d577c385316bb99107f60e63169dacc37db.tar.gz
+sha256  7d425e18ebc427b3df5ff31185b4dc29c6bfd54f8e167f57c2254cea341a26c6  rtl8189fs-62c31d577c385316bb99107f60e63169dacc37db.tar.gz
