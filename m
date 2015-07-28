From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:53 -0300
Subject: [Buildroot] [PATCH 052/113] lshw: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-52-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lshw/lshw.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lshw/lshw.hash

diff --git a/package/lshw/lshw.hash b/package/lshw/lshw.hash
new file mode 100644
index 0000000..d829369
--- /dev/null
+++ b/package/lshw/lshw.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	809882429555b93259785cc261dbff04c16c93d064db5f445a51945bc47157cb	lshw-B.02.16.tar.gz
-- 
2.3.6
