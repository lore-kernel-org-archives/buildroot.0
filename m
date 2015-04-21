From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 21 Apr 2015 04:38:55 +0200
Subject: [Buildroot] [PATCH 2/3] package/cache-calibrator: add hash
In-Reply-To: <1429583936-13335-1-git-send-email-fabio.porcedda@gmail.com>
References: <1429583936-13335-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1429583936-13335-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/cache-calibrator/cache-calibrator.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/cache-calibrator/cache-calibrator.hash

diff --git a/package/cache-calibrator/cache-calibrator.hash b/package/cache-calibrator/cache-calibrator.hash
new file mode 100644
index 0000000..df61d17
--- /dev/null
+++ b/package/cache-calibrator/cache-calibrator.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2018ed8fa733155d44ceb1c0066c5cf8df7771cdf7cfca0a07b8dd9bebd9c221 calibrator.c
-- 
2.3.5
