From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:23 -0300
Subject: [Buildroot] [PATCH 082/113] python-cffi: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-82-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-cffi/python-cffi.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/python-cffi/python-cffi.hash

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
new file mode 100644
index 0000000..b41c979
--- /dev/null
+++ b/package/python-cffi/python-cffi.hash
@@ -0,0 +1,4 @@
+# From https://pypi.python.org/pypi/cffi/0.8.6
+md5	474b5a68299a6f05009171de1dc91be6	cffi-0.8.6.tar.gz
+# Calculated based on the hash above
+sha256	2532d9e3af9e3c6d0f710fc98b0295b563c7f39cfd97dd2242bd36fbf4900610	cffi-0.8.6.tar.gz
-- 
2.3.6
