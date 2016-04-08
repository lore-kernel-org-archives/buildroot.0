From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Apr 2016 05:01:14 +0200
Subject: [Buildroot] [git commit] sawman: completely remove the package
Message-ID: <20160408030327.0158F7FFB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efdc956cc19195f932d948896a0d8e4c9df683cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 11573f5a14d1c2726ce9623de3a5f118085a420f ("sawman: remove
package"), we removed the sawman package, but forgot to remove the
hash file of that package. This commit finalizes the removal by
getting rid of the hash file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sawman/sawman.hash | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/sawman/sawman.hash b/package/sawman/sawman.hash
deleted file mode 100644
index 6fd2ecd..0000000
--- a/package/sawman/sawman.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256	2cfb0a5d5114e6d0eb777b881ede2614d047786b90c505897c9e5d45288e0d4c	SaWMan-1.6.3.tar.gz
