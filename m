From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:09 -0300
Subject: [Buildroot] [PATCH 008/113] fbv: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fbv/fbv.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/fbv/fbv.hash

diff --git a/package/fbv/fbv.hash b/package/fbv/fbv.hash
new file mode 100644
index 0000000..892012b
--- /dev/null
+++ b/package/fbv/fbv.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	9b55b9dafd5eb01562060d860e267e309a1876e8ba5ce4d3303484b94129ab3c	fbv-1.0b.tar.gz
-- 
2.3.6
