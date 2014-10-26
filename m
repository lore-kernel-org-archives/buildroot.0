From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 17:35:13 +0100
Subject: [Buildroot] [PATCH 1/3] opencv: Remove hash file
Message-ID: <1414341315-31896-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the tarball we download is generated from GitHub, there's no
saying that the tarball won't differ in a month from now.
So the hash has no value there.

An update to the manual should be done.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/opencv/opencv.hash | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 package/opencv/opencv.hash

diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
deleted file mode 100644
index fc3b750..0000000
--- a/package/opencv/opencv.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://github.com/itseez/opencv/archive/2.4.10/
-md5	3346a59310d788d3845f4fd6043a108a	opencv-2.4.10.tar.gz
-sha1	a0c2d5944364fc4f26b6160b33c03082b1fa08c1	opencv-2.4.10.tar.gz
-- 
2.1.1
