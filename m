From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 11:20:02 -0300
Subject: [Buildroot] [PATCH 04/11] util-linux: add hash
In-Reply-To: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410963609-18128-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/util-linux/util-linux.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/util-linux/util-linux.hash

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
new file mode 100644
index 0000000..cfa1364
--- /dev/null
+++ b/package/util-linux/util-linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.25/sha256sums.asc
+sha256	4701305ae22790c3a92ce48e50794fa05b7ee01f4227f419a171c100d08986e8	util-linux-2.25.1.tar.xz
-- 
1.8.5.5
