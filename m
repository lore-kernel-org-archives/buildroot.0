From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 May 2019 21:50:00 +0200
Subject: [Buildroot] [git commit] package/genimage: add COPYING sha256 hash
Message-ID: <20190602201235.59B738EDEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de1e3a10e6bfe48a04b6ad659e9c41561e322600
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulo Serra Filho <ptvsf@cesar.org.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/genimage/genimage.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index dedb32b2e1..c1f2270d28 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	2ee024bfb2ec157651b86f3365d138ee013dcc48277d86e1eed6f3285a67b532	genimage-11.tar.xz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
