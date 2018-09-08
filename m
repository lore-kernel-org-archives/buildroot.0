From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 22:35:54 +0200
Subject: [Buildroot] [git commit] libminiupnpc: fix hash for license
Message-ID: <20180908203508.EF687836D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f39fbbbb8f2d4c31f65182ab10393080c207cb2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LICENSE file change: replace '2015' with '2016' (commit
cc9639d597f89c9f2478d36871f7741dd91e724a)

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libminiupnpc/libminiupnpc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index b35e7f045d..556d8cc45a 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 e19fb5e01ea5a707e2a8cb96f537fbd9f3a913d53d804a3265e3aeab3d2064c6  miniupnpc-2.1.tar.gz
-sha256 4025f2214fa46ad40c156605b83d66e8faf45823e67eb3337af3869716e6d7dd  LICENSE
+sha256 e2df21b3d4b1a84a0ac31d808a3ff330fdf3602e0839a526d3df2fcfba287ac4  LICENSE
