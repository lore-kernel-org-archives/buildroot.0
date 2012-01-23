From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 23 Jan 2012 12:28:51 +0100
Subject: [Buildroot] [PATCH v4 1/2] Introduce /run directory
Message-ID: <1327318132-27793-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 fs/skeleton/run |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 120000 fs/skeleton/run

diff --git a/fs/skeleton/run b/fs/skeleton/run
new file mode 120000
index 0000000..1c2f433
--- /dev/null
+++ b/fs/skeleton/run
@@ -0,0 +1 @@
+tmp
\ No newline at end of file
-- 
1.7.1.1
