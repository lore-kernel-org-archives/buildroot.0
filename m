From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:10 -0300
Subject: [Buildroot] [PATCH 069/113] parted: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-69-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/parted/parted.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/parted/parted.hash

diff --git a/package/parted/parted.hash b/package/parted/parted.hash
new file mode 100644
index 0000000..297b5d7
--- /dev/null
+++ b/package/parted/parted.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15	parted-3.1.tar.xz
-- 
2.3.6
