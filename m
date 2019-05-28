From: deinok at deinok.com <deinok@deinok.com>
Date: Tue, 28 May 2019 15:41:05 +0200
Subject: [Buildroot] [PATCH 2/2] package/mender: better default mender.config
In-Reply-To: <20190528134105.30572-1-deinok@deinok.com>
References: <20190528134105.30572-1-deinok@deinok.com>
Message-ID: <20190528134105.30572-2-deinok@deinok.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Raul Hidalgo Caballero <deinok@deinok.com>

Signed-off-by: Raul Hidalgo Caballero <deinok@deinok.com>
---
 package/mender/mender.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mender/mender.conf b/package/mender/mender.conf
index 979f16aaf6..7eb9fb18b4 100644
--- a/package/mender/mender.conf
+++ b/package/mender/mender.conf
@@ -2,9 +2,9 @@
   "InventoryPollIntervalSeconds": 1800,
   "UpdatePollIntervalSeconds": 1800,
   "RetryPollIntervalSeconds": 300,
-  "RootfsPartA": "mmcblk0p2",
-  "RootfsPartB": "mmcblk0p3",
+  "RootfsPartA": "/dev/mmcblk0p1",
+  "RootfsPartB": "/dev/mmcblk0p2",
   "ServerCertificate": "/etc/mender/server.crt",
-  "ServerURL": "https://docker.mender.io",
+  "ServerURL": "https://hosted.mender.io",
   "TenantToken": "dummy"
 }
-- 
2.17.1
