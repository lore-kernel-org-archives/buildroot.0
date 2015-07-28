From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:39 -0300
Subject: [Buildroot] [PATCH 038/113] libqrencode: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-38-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libqrencode/libqrencode.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libqrencode/libqrencode.hash

diff --git a/package/libqrencode/libqrencode.hash b/package/libqrencode/libqrencode.hash
new file mode 100644
index 0000000..8c94ccd
--- /dev/null
+++ b/package/libqrencode/libqrencode.hash
@@ -0,0 +1,2 @@
+# From http://fukuchi.org/works/qrencode/qrencode-3.4.2.tar.gz.sha1
+sha1	7daaad61f333ff6cdabfb0d925c3ab668d16dee2	qrencode-3.4.2.tar.gz
-- 
2.3.6
