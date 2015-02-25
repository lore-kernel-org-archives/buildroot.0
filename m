From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Feb 2015 10:07:19 -0300
Subject: [Buildroot] [PATCH 2/5] libao: add hash
In-Reply-To: <1424869642-9080-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424869642-9080-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1424869642-9080-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libao/libao.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libao/libao.hash

diff --git a/package/libao/libao.hash b/package/libao/libao.hash
new file mode 100644
index 0000000..64174da
--- /dev/null
+++ b/package/libao/libao.hash
@@ -0,0 +1,2 @@
+# From http://downloads.xiph.org/releases/ao/SHA256SUMS.txt
+sha256	03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf	libao-1.2.0.tar.gz
-- 
2.0.5
