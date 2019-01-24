From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:25:43 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/lighttpd: adjust
 hash comment after 1.4.52 bump
Message-ID: <20190124152547.A768B81317@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fed0c666e60adf74bb8b3c20f1777416101593c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Commit ec69d3820f (package/lighttpd: bump to version 1.4.52) bumped the
lighttpd version but forgot to adjust the upstream hash comment.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b99b09caee8b9857ebfd229d8ff97e893c11ec83)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 0fb00bf568..93581a9abb 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.51.sha256sum
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.52.sha256sum
 sha256 27bc0991c530b7c6335e6efff2181934d3c1a1c516f7401ea71d8302cefda764  lighttpd-1.4.52.tar.xz
 # Locally calculated
 sha256 5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
