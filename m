From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Thu, 30 Oct 2014 10:36:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/upmpdcli: add hash file
In-Reply-To: <1414661812-20957-1-git-send-email-jkrause@posteo.de>
References: <1414661812-20957-1-git-send-email-jkrause@posteo.de>
Message-ID: <1414661812-20957-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/upmpdcli/upmpdcli.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/upmpdcli/upmpdcli.hash

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
new file mode 100644
index 0000000..8822aed
--- /dev/null
+++ b/package/upmpdcli/upmpdcli.hash
@@ -0,0 +1,2 @@
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.8.5.tar.gz.sha256
+sha256 1903214a6170b1cc3a95d22ed23d0f9c78525721506f000bef846657e7517e4c  upmpdcli-0.8.5.tar.gz
-- 
2.1.3
