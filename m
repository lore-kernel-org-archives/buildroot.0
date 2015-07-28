From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:25 -0300
Subject: [Buildroot] [PATCH 024/113] libatasmart: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-24-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libatasmart/libatasmart.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libatasmart/libatasmart.hash

diff --git a/package/libatasmart/libatasmart.hash b/package/libatasmart/libatasmart.hash
new file mode 100644
index 0000000..8733d07
--- /dev/null
+++ b/package/libatasmart/libatasmart.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	61f0ea345f63d28ab2ff0dc352c22271661b66bf09642db3a4049ac9dbdb0f8d	libatasmart-0.19.tar.xz
-- 
2.3.6
