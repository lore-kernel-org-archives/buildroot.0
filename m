From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Oct 2014 20:19:54 +0200
Subject: [Buildroot] [PATCH 2/3] package/libcap: add hash file
In-Reply-To: <1414261195-5009-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414261195-5009-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1414261195-5009-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcap/libcap.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libcap/libcap.hash

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
new file mode 100644
index 0000000..75822e5
--- /dev/null
+++ b/package/libcap/libcap.hash
@@ -0,0 +1,2 @@
+# https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
+sha256	cee4568f78dc851d726fc93f25f4ed91cc223b1fe8259daa4a77158d174e6c65	libcap-2.24.tar.xz
-- 
1.7.10.4
