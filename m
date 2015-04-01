From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed,  1 Apr 2015 21:49:00 +0200
Subject: [Buildroot] [PATCH 2/2] bmon: remove hash file for GitHub helper
	package
In-Reply-To: <1427917740-17656-1-git-send-email-yegorslists@googlemail.com>
References: <1427917740-17656-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1427917740-17656-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/bmon/bmon.hash | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 package/bmon/bmon.hash

diff --git a/package/bmon/bmon.hash b/package/bmon/bmon.hash
deleted file mode 100644
index 65747b4..0000000
--- a/package/bmon/bmon.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  62c8c20d00572a7670891d4c112924786cb69ec4ca92d5052951566f000d1514  bmon-3.6.tar.gz
-- 
2.1.0
