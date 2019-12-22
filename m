From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 22 Dec 2019 09:37:08 +0100
Subject: [Buildroot] [PATCH] package/open2300: add hash file
Message-ID: <20191222083707.3448-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add sha256 tarball hash
- add sha256 license hash

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/open2300/open2300.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/open2300/open2300.hash

diff --git a/package/open2300/open2300.hash b/package/open2300/open2300.hash
new file mode 100644
index 0000000000..913cccf4d2
--- /dev/null
+++ b/package/open2300/open2300.hash
@@ -0,0 +1,2 @@
+sha256	f4239d2f16d52156586d06be38f06a3eb58168377e243a8de8720b66e33ddb8f  open2300-12.tar.gz
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
-- 
2.20.1
