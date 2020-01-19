From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2020 09:55:48 +0100
Subject: [Buildroot] [git commit] package/micropython: add hash for license
 file
Message-ID: <20200119084903.85A3982887@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7548993dcaeefc28e8e1a44f0adcd2ffb5d38ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/micropython/micropython.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index a889044ef3..49fd903fab 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,3 @@
 #locally computed
 sha256 330cd32c7b67cb6b531d158eabcf68af3a7d7ad7b5a4b0ce3c73da3d241da6a2  micropython-1.12.tar.gz
+sha256 afde3432122205e8e08d615fcb920aca58631c52b6c0c01813854287a457b298  LICENSE
