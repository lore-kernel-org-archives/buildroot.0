From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:22 -0300
Subject: [Buildroot] [PATCH 081/113] python-bottle: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-81-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-bottle/python-bottle.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/python-bottle/python-bottle.hash

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
new file mode 100644
index 0000000..8c7d428
--- /dev/null
+++ b/package/python-bottle/python-bottle.hash
@@ -0,0 +1,4 @@
+# From https://pypi.python.org/pypi/bottle/0.12.7
+md5	ed0b83c9dbbdbde784e7c652d61c59f4	bottle-0.12.7.tar.gz
+# Calculated based on the hash above
+sha256	e3ea2191f06ca51af45bf6ca41ed2d1b2d809ceda0876466879fe205be7b2073	bottle-0.12.7.tar.gz
-- 
2.3.6
