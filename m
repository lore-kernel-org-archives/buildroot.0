From: Alex Suykov <alex.suykov@gmail.com>
Date: Wed, 30 Dec 2015 16:06:05 +0200
Subject: [Buildroot] [PATCH 3/3] vboot-utils: remove hash file
In-Reply-To: <cover.1451483256.git.alex.suykov@gmail.com>
References: <cover.1451483256.git.alex.suykov@gmail.com>
Message-ID: <05e1570e0377fc9e913819765ecb8e488b6b6c1a.1451483256.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package uses git to download the sources.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/vboot-utils/vboot-utils.hash | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 package/vboot-utils/vboot-utils.hash

diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
deleted file mode 100644
index e161423..0000000
--- a/package/vboot-utils/vboot-utils.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Git shapshot
-none	xxx	bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
-- 
2.6.4
