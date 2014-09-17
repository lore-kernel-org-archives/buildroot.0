From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 11:20:08 -0300
Subject: [Buildroot] [PATCH 10/11] iproute2: add hash
In-Reply-To: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410963609-18128-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iproute2/iproute2.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/iproute2/iproute2.hash

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
new file mode 100644
index 0000000..5a8e6ca
--- /dev/null
+++ b/package/iproute2/iproute2.hash
@@ -0,0 +1,2 @@
+# From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
+sha256	1f0a8a6c0e872166f75433f5cbf9766f3002b5c2f13501b3bb8c51846a127b79	iproute2-3.16.0.tar.xz
-- 
1.8.5.5
