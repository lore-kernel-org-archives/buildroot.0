From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:23 -0300
Subject: [Buildroot] [PATCH 022/113] jansson: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-22-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jansson/jansson.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/jansson/jansson.hash

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
new file mode 100644
index 0000000..013d929
--- /dev/null
+++ b/package/jansson/jansson.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	7905e6590fb316c0ff943df3dc6a21cd81a59cff7a6d12514054c359d04d78d7	jansson-2.7.tar.gz
-- 
2.3.6
