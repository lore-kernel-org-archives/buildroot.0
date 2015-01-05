From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon,  5 Jan 2015 15:05:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/shairport-sync: add hash file
In-Reply-To: <1420466748-6155-1-git-send-email-jkrause@posteo.de>
References: <1420466748-6155-1-git-send-email-jkrause@posteo.de>
Message-ID: <1420466748-6155-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/shairport-sync/shairport-sync.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/shairport-sync/shairport-sync.hash

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
new file mode 100644
index 0000000..ebf8c2e
--- /dev/null
+++ b/package/shairport-sync/shairport-sync.hash
@@ -0,0 +1,2 @@
+# Locally calculated from download
+sha256	b6217d9db2d47a45326917a60534433db341997ef1c014ef79041b5c393d1eb1  shairport-sync-2.1.15.tar.gz
-- 
2.2.1
