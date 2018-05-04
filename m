From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 May 2018 23:38:55 +0200
Subject: [Buildroot] [PATCH 1/1] libmpeg2: add hash for license file
Message-ID: <20180504213855.4984-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
