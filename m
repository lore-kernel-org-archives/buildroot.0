From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 20:50:35 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add entry for the
 bananapi_m2_ultra_defconfig
Message-ID: <20181208200042.4E6DD86C48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cad6f1fabb6b67bb2c6b5222cd4d3cfd351b22fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lothar contributed this board not long ago, so let's assume he is
willing to take care of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c289b3f0c5..8dfe579061 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1233,6 +1233,8 @@ N:	Lionel Orry <lionel.orry@gmail.com>
 F:	package/mongrel2/
 
 N:	Lothar Felten <lothar.felten@gmail.com>
+F:	board/bananapi/bananapi-m2-ultra/
+F:	configs/bananapi_m2_ultra_defconfig
 F:	package/ti-sgx-demos/
 F:	package/ti-sgx-km/
 F:	package/ti-sgx-um/
