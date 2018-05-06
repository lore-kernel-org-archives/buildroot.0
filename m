From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 09:03:54 +0200
Subject: [Buildroot] [git commit] libmpeg2: add hash for license file
Message-ID: <20180506071548.31F1C8641C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b19d6adc377f52fe5b48a684904bf1745e3c4fe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmpeg2/libmpeg2.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmpeg2/libmpeg2.hash b/package/libmpeg2/libmpeg2.hash
index c2adb67de0..615d0ea6bf 100644
--- a/package/libmpeg2/libmpeg2.hash
+++ b/package/libmpeg2/libmpeg2.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  dee22e893cb5fc2b2b6ebd60b88478ab8556cb3b93f9a0d7ce8f3b61851871d4  libmpeg2-0.5.1.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
