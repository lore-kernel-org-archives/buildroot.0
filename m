From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Mar 2018 17:57:51 +0100
Subject: [Buildroot] [git commit] systemd: correct README hash after bump to
 version 237
Message-ID: <20180301172059.7AE9081492@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fb7edaf98481be5244c9398f6344b0c06816f42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd-237 slightly changed the README, but the hash was not updated
leading to legal-info failing.  Fix it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 74cc5dd825..d580a29b83 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -2,4 +2,4 @@
 sha256	c83dabbe1c9de6b9db1dafdb7e04140c7d0535705c68842f6c0768653ba4913c	systemd-237.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
-sha256	f6a739f5ee7f10df6467021066038297c0150ff680db9a4b9f60da53b11aa560	README
+sha256	9c7709aa401a41c4c3f33ea75c34ae5d5354d62c310c3391c2a5958952d8aadd	README
