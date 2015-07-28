From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:26 -0300
Subject: [Buildroot] [PATCH 085/113] python-flup: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-85-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-flup/python-flup.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/python-flup/python-flup.hash

diff --git a/package/python-flup/python-flup.hash b/package/python-flup/python-flup.hash
new file mode 100644
index 0000000..50a0381
--- /dev/null
+++ b/package/python-flup/python-flup.hash
@@ -0,0 +1,4 @@
+# From https://pypi.python.org/pypi/flup/1.0.3.dev-20110405
+md5	a005b072d144fc0e44b0fa4c5a9ba029	flup-1.0.3.dev-20110405.tar.gz
+# Calculated based on the hash above
+sha256	6649cf41854ea8782c795cdde64fdf79a90db821533d3652f91d21b0a7f39c79	flup-1.0.3.dev-20110405.tar.gz
-- 
2.3.6
