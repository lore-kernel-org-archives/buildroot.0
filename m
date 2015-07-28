From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:40 -0300
Subject: [Buildroot] [PATCH 099/113] sysprof: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-99-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sysprof/sysprof.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sysprof/sysprof.hash

diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
new file mode 100644
index 0000000..8541ecc
--- /dev/null
+++ b/package/sysprof/sysprof.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	baf03c6fc01a845c705873e6fc7927aa89539dcda6963f9ec4c8eb4c086a64f1	sysprof-1.2.0.tar.gz
-- 
2.3.6
