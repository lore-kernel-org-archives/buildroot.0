From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon,  5 Jan 2015 17:35:37 +0100
Subject: [Buildroot] [PATCH 2/2] package/nodejs: add hash file
In-Reply-To: <1420475737-13153-1-git-send-email-jkrause@posteo.de>
References: <1420475737-13153-1-git-send-email-jkrause@posteo.de>
Message-ID: <1420475737-13153-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/nodejs/nodejs.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/nodejs/nodejs.hash

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
new file mode 100644
index 0000000..a6f2698
--- /dev/null
+++ b/package/nodejs/nodejs.hash
@@ -0,0 +1,2 @@
+# From upstream URL: http://nodejs.org/dist/v0.10.35/SHASUMS256.txt
+sha256	0043656bb1724cb09dbdc960a2fd6ee37d3badb2f9c75562b2d11235daa40a03  node-v0.10.35.tar.gz
-- 
2.2.1
