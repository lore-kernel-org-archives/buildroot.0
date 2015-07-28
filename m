From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:24 -0300
Subject: [Buildroot] [PATCH 083/113] python-cheetah: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-83-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-cheetah/python-cheetah.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/python-cheetah/python-cheetah.hash

diff --git a/package/python-cheetah/python-cheetah.hash b/package/python-cheetah/python-cheetah.hash
new file mode 100644
index 0000000..477ee54
--- /dev/null
+++ b/package/python-cheetah/python-cheetah.hash
@@ -0,0 +1,4 @@
+# From https://pypi.python.org/pypi/Cheetah/2.4.4
+md5	853917116e731afbc8c8a43c37e6ddba	Cheetah-2.4.4.tar.gz
+# Calculated based on the hash above
+sha256	be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550	Cheetah-2.4.4.tar.gz
-- 
2.3.6
