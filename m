From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:38 -0300
Subject: [Buildroot] [PATCH 037/113] libraw: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-37-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libraw/libraw.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libraw/libraw.hash

diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
new file mode 100644
index 0000000..98d3c12
--- /dev/null
+++ b/package/libraw/libraw.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	588caf5324c76240d6370852691e05ac8ef89428ee8d45168f15ce47422bc36b  LibRaw-0.13.4.tar.gz
-- 
2.3.6
