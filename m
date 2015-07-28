From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:10 -0300
Subject: [Buildroot] [PATCH 009/113] flickcurl: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/flickcurl/flickcurl.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/flickcurl/flickcurl.hash

diff --git a/package/flickcurl/flickcurl.hash b/package/flickcurl/flickcurl.hash
new file mode 100644
index 0000000..fd091ec
--- /dev/null
+++ b/package/flickcurl/flickcurl.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	ff42a36c7c1c7d368246f6bc9b7d792ed298348e5f0f5d432e49f6803562f5a3	flickcurl-1.26.tar.gz
-- 
2.3.6
