From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 19:24:18 +0100
Subject: [Buildroot] [git commit] package/systemd: fix README hash
Message-ID: <20191027181743.6A9A08A3CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f81b26ec52f5bc600478d003fe7882c9dd47952c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: http://autobuild.buildroot.net/results/487/4878af2ed318925ab530062576f91e7a1af47bd5/

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index bc8edfcdba..2f2c11089c 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -2,4 +2,4 @@
 sha256	0611843c2407f8b125b1b7cb93533bdebd4ccf91c99dffa64ec61556a258c7d1  	systemd-243.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
-sha256	d9356b277440f21730426592c27170d034a39954ab5154dfba1cc3cbf7b22935	README
+sha256	3a3b3cbd0ef03c7045bfda9b61062bdc33ad4913b44a6b6147043f26d00b51bf	README
