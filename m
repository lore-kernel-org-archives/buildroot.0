From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  9 May 2015 10:41:28 +0200
Subject: [Buildroot] [PATCH 2/3] package/mono: adding hash file
In-Reply-To: <1431160889-3851-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1431160889-3851-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1431160889-3851-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the hash file for mono 4.0.0.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mono/mono.hash

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
new file mode 100644
index 0000000..c1d0c6e
--- /dev/null
+++ b/package/mono/mono.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 4485d8b44a939bef64b3b1b6a7f0388761cfe6803e149aa1e56aab023cfb267e  mono-4.0.0.tar.bz2
-- 
1.9.1
