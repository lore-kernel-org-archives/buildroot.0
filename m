From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 20 Apr 2015 05:25:44 +0200
Subject: [Buildroot] [PATCH 2/3] package/dmalloc: add hash
In-Reply-To: <1429500345-31730-1-git-send-email-fabio.porcedda@gmail.com>
References: <1429500345-31730-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1429500345-31730-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/dmalloc/dmalloc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/dmalloc/dmalloc.hash

diff --git a/package/dmalloc/dmalloc.hash b/package/dmalloc/dmalloc.hash
new file mode 100644
index 0000000..e74ef74
--- /dev/null
+++ b/package/dmalloc/dmalloc.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 d3be5c6eec24950cb3bd67dbfbcdf036f1278fae5fd78655ef8cdf9e911e428a dmalloc-5.5.2.tgz
-- 
2.3.5
