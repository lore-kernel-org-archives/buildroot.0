From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 21:09:52 +0200
Subject: [Buildroot] [git commit] package/libuhttpd: fix tarball name in
 hash file
Message-ID: <20200914190100.D7BE286E55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d127c38a542b755f268605e34d937823fc46c896
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 819a4207f6a5c3b579cb5191b03b51ebec4298ff forgot to rename
libuhttpd-3.2.0.tar.gz

Fixes:
 - http://autobuild.buildroot.org/results/965be1c72996df94668be81d1e90ed6937fb9a7c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuhttpd/libuhttpd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 66fd2f07a2..b7c839a5f0 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  161aac7a09ed143278804f8f55ed3c1dd3c813cd68418325ca8862acdaf8a163  libuhttpd-3.2.0.tar.gz
+sha256  161aac7a09ed143278804f8f55ed3c1dd3c813cd68418325ca8862acdaf8a163  libuhttpd-3.3.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
