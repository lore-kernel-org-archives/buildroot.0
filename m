From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 25 May 2015 17:30:35 +0200
Subject: [Buildroot] [PATCH 2/5] package/knock: add hash file
In-Reply-To: <1432567838-2948-1-git-send-email-fabio.porcedda@gmail.com>
References: <1432567838-2948-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1432567838-2948-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/knock/knock.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/knock/knock.hash

diff --git a/package/knock/knock.hash b/package/knock/knock.hash
new file mode 100644
index 0000000..ae152db
--- /dev/null
+++ b/package/knock/knock.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 9938479c321066424f74c61f6bee46dfd355a828263dc89561a1ece3f56578a4 knock-0.7.tar.gz
-- 
2.4.1
