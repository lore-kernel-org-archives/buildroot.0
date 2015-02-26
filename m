From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Feb 2015 09:31:18 -0300
Subject: [Buildroot] [PATCH] libshout: add hash
In-Reply-To: <1424953878-23889-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424953878-23889-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1424953878-23889-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libshout/libshout.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libshout/libshout.hash

diff --git a/package/libshout/libshout.hash b/package/libshout/libshout.hash
new file mode 100644
index 0000000..908bd99
--- /dev/null
+++ b/package/libshout/libshout.hash
@@ -0,0 +1,2 @@
+# From http://downloads.xiph.org/releases/libshout/SHA256SUMS
+sha256	cf3c5f6b4a5e3fcfbe09fb7024aa88ad4099a9945f7cb037ec06bcee7a23926e	libshout-2.3.1.tar.gz
-- 
2.0.5
