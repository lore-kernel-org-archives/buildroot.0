From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:49 -0300
Subject: [Buildroot] [PATCH 048/113] libzip: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-48-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libzip/libzip.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libzip/libzip.hash

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
new file mode 100644
index 0000000..ccd0e6a
--- /dev/null
+++ b/package/libzip/libzip.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	7cfbbc2c540e154b933b6e9ec781e2671086bd8114eb744ae1a1ade34d2bb6bb	libzip-0.11.2.tar.xz
-- 
2.3.6
