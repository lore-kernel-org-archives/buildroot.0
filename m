From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 21:32:18 +0100
Subject: [Buildroot] [git commit] package/kodi: add hash for license file
Message-ID: <20191113203143.A63048EE82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f761492ac9bf425b57f6a54d09c77f9699f2609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi/kodi.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 8018c67a3a..2b2e5e64f9 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -8,3 +8,5 @@ sha256 b6eb2d929ff56cb051152c32010afc5e7cf5fe8c5ae32dca412a2b46b6b57e34  2f12236
 sha256 312b3d15bc448d24e92f4b2e7248409525eccc4e75776026d805478e51c5ef3d  981488f.tar.gz
 # Locally computed - libdvdread
 sha256 e7179b2054163652596a56301c9f025515cb08c6d6310b42b897c3ad11c0199b  17d99db.tar.gz
+# Locally computed
+sha256 89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
