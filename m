From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:09 -0300
Subject: [Buildroot] [PATCH 068/113] ortp: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-68-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ortp/ortp.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ortp/ortp.hash

diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
new file mode 100644
index 0000000..728a0d1
--- /dev/null
+++ b/package/ortp/ortp.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	6e37e29b3c3559bac1f2ae0c977f6ceb4d4ce8dc713b691dea8bae57bda92d0b	ortp-0.22.0.tar.gz
-- 
2.3.6
