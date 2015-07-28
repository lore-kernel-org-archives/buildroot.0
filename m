From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:41 -0300
Subject: [Buildroot] [PATCH 100/113] tinc: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-100-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tinc/tinc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/tinc/tinc.hash

diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
new file mode 100644
index 0000000..721b6bd
--- /dev/null
+++ b/package/tinc/tinc.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	498e58f9f39e3922030a63cf62baf4b46a40fbda8d90b23ec0f084f4a9f9b687	tinc-1.0.24.tar.gz
-- 
2.3.6
