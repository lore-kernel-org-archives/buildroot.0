From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:34 -0300
Subject: [Buildroot] [PATCH 093/113] simicsfs: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-93-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/simicsfs/simicsfs.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/simicsfs/simicsfs.hash

diff --git a/package/simicsfs/simicsfs.hash b/package/simicsfs/simicsfs.hash
new file mode 100644
index 0000000..42ada91
--- /dev/null
+++ b/package/simicsfs/simicsfs.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	d0cf7caf888dc1e7dc9496c4b59af98eb2b69d6113d6920757465902e1f21f38	simicsfs-1.18.tar.gz
-- 
2.3.6
