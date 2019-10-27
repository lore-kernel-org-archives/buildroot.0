From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 27 Oct 2019 18:48:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix README hash
Message-ID: <20191027174806.97413-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://autobuild.buildroot.net/results/487/4878af2ed318925ab530062576f91e7a1af47bd5/

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
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
-- 
2.21.0
