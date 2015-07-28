From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:37 -0300
Subject: [Buildroot] [PATCH 036/113] libpthsem: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-36-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpthsem/libpthsem.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libpthsem/libpthsem.hash

diff --git a/package/libpthsem/libpthsem.hash b/package/libpthsem/libpthsem.hash
new file mode 100644
index 0000000..b6aa2b8
--- /dev/null
+++ b/package/libpthsem/libpthsem.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	4024cafdd5d4bce2b1778a6be5491222c3f6e7ef1e43971264c451c0012c5c01  pthsem_2.0.8.tar.gz
-- 
2.3.6
