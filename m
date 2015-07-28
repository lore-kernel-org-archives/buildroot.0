From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:35 -0300
Subject: [Buildroot] [PATCH 034/113] libosip2: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-34-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libosip2/libosip2.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libosip2/libosip2.hash

diff --git a/package/libosip2/libosip2.hash b/package/libosip2/libosip2.hash
new file mode 100644
index 0000000..9ff2d9a
--- /dev/null
+++ b/package/libosip2/libosip2.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	c9a18b0c760506d150017cdb1fa5c1cefe12b8dcbbf9a7e784eb75af376e96cd	libosip2-3.6.0.tar.gz
-- 
2.3.6
