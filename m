From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Nov 2019 20:14:40 +0100
Subject: [Buildroot] [git commit] package/systemd: fix license hash
Message-ID: <20191124190842.A967D88FC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=274a4092eef111951d10d5f773b772c742e357a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to 243.4 forgot to update hash of README file (update to the
requirements).

Fixes:
 - http://autobuild.buildroot.org/results/eae13046b90253cdb2bf260e10b316386dff4eb1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: explain why README was changed]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 4c126d3755..584198d14b 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -2,4 +2,4 @@
 sha256	281bc47aa6b173c3c6fa1bbc88aea84ecb014313aeb679c54f8885dd09e434be	systemd-243.4.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
-sha256	3a3b3cbd0ef03c7045bfda9b61062bdc33ad4913b44a6b6147043f26d00b51bf	README
+sha256	ff5a9e3791e3a941a2d85b5ef7ad7c01441dd42f4c760bff2c8b086c7d764885	README
