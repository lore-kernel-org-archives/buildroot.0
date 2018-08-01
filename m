From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  1 Aug 2018 14:57:21 +0200
Subject: [Buildroot] [PATCH 4/4] minicom: delete hash file.
In-Reply-To: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
References: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180801125721.34654-5-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minicom is now under git repo, not tar.gz anymore.

With git repo don't need hash file.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/minicom/minicom.hash | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 package/minicom/minicom.hash

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
deleted file mode 100644
index ca3087160b..0000000000
--- a/package/minicom/minicom.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1  minicom-2.7.1.tar.gz
-- 
2.17.1
