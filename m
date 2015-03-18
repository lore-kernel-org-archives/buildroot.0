From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 11:29:14 -0300
Subject: [Buildroot] [PATCH 5/6] opus-tools: add hash file
In-Reply-To: <1426688955-23233-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426688955-23233-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426688955-23233-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/opus-tools/opus-tools.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/opus-tools/opus-tools.hash

diff --git a/package/opus-tools/opus-tools.hash b/package/opus-tools/opus-tools.hash
new file mode 100644
index 0000000..486384c
--- /dev/null
+++ b/package/opus-tools/opus-tools.hash
@@ -0,0 +1,2 @@
+# From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
+sha256	b1873dd78c7fbc98cf65d6e10cfddb5c2c03b3af93f922139a2104baedb4643a	opus-tools-0.1.9.tar.gz
-- 
2.0.5
