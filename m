From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:47 -0300
Subject: [Buildroot] [PATCH 046/113] libxslt: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-46-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxslt/libxslt.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libxslt/libxslt.hash

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
new file mode 100644
index 0000000..140db09
--- /dev/null
+++ b/package/libxslt/libxslt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c	libxslt-1.1.28.tar.gz
-- 
2.3.6
