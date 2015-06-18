From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 18 Jun 2015 18:50:53 +0200
Subject: [Buildroot] [PATCH] python-netifaces: add hash file
Message-ID: <1434646253-2044-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-netifaces/python-netifaces.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/python-netifaces/python-netifaces.hash

diff --git a/package/python-netifaces/python-netifaces.hash b/package/python-netifaces/python-netifaces.hash
new file mode 100644
index 0000000..aebfdf6
--- /dev/null
+++ b/package/python-netifaces/python-netifaces.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=36da76e2cfadd24cc7510c2c0012eb1e, sha256 locally computed
+md5     36da76e2cfadd24cc7510c2c0012eb1e                                  netifaces-0.10.4.tar.gz
+sha256  9656a169cb83da34d732b0eb72b39373d48774aee009a3d1272b7ea2ce109cde  netifaces-0.10.4.tar.gz
-- 
2.1.4
