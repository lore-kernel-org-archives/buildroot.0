From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:27 -0300
Subject: [Buildroot] [PATCH 026/113] libebml: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-26-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libebml/libebml.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libebml/libebml.hash

diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
new file mode 100644
index 0000000..d5a8cb8
--- /dev/null
+++ b/package/libebml/libebml.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	195894b31aaca55657c9bc157d744f23b0c25597606b97cfa5a9039c4b684295	libebml-1.3.1.tar.bz2
-- 
2.3.6
