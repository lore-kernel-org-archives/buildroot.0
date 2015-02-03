From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 15:55:55 +0100
Subject: [Buildroot] [git commit] opencv: Remove hash file
Message-ID: <20150203145637.F0B7880802@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb8ce5f0016fa14f5e6971e07416ed465e641ff7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the tarball we download is generated from GitHub, there's no
saying that the tarball won't differ in a month from now.
So the hash has no value there.

An update to the manual should be done.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.hash |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
deleted file mode 100644
index fc3b750..0000000
--- a/package/opencv/opencv.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://github.com/itseez/opencv/archive/2.4.10/
-md5	3346a59310d788d3845f4fd6043a108a	opencv-2.4.10.tar.gz
-sha1	a0c2d5944364fc4f26b6160b33c03082b1fa08c1	opencv-2.4.10.tar.gz
