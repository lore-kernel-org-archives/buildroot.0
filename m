From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:37:00 +0200
Subject: [Buildroot] [git commit] package/libtheora: add license hashes
Message-ID: <20190703224540.99B6587FEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1ef74df3b95c088bfe162f51043d004a4146de2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libtheora/libtheora.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libtheora/libtheora.hash b/package/libtheora/libtheora.hash
index daf245570a..45376ddaa4 100644
--- a/package/libtheora/libtheora.hash
+++ b/package/libtheora/libtheora.hash
@@ -1,2 +1,6 @@
 # From http://downloads.xiph.org/releases/theora/SHA256SUMS
 sha256	f36da409947aa2b3dcc6af0a8c2e3144bc19db2ed547d64e9171c59c66561c61	libtheora-1.1.1.tar.xz
+
+# Locally calculated
+sha256	8417fad7da775735564e209484a2e011e0fa201e94f01fdbee6e4977e478e6fc	COPYING
+sha256	654a0238f789f4435c4818f50005b141d013c5a09a31d861efc1d0d67ba975a4	LICENSE
