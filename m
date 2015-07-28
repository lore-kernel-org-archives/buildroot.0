From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:07 -0300
Subject: [Buildroot] [PATCH 006/113] fbdump: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fbdump/fbdump.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/fbdump/fbdump.hash

diff --git a/package/fbdump/fbdump.hash b/package/fbdump/fbdump.hash
new file mode 100644
index 0000000..15cc839
--- /dev/null
+++ b/package/fbdump/fbdump.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c4d521a86229b3106cf69786008ad94f899da5288a19a067deae84951880722d	fbdump-0.4.2.tar.gz
-- 
2.3.6
