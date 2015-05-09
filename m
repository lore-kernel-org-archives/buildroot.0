From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  9 May 2015 10:41:29 +0200
Subject: [Buildroot] [PATCH 3/3] package/monolite: adding hash file
In-Reply-To: <1431160889-3851-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1431160889-3851-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1431160889-3851-4-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds hash file for monolite version 117.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/monolite/monolite.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/monolite/monolite.hash

diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
new file mode 100644
index 0000000..1139c0a
--- /dev/null
+++ b/package/monolite/monolite.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256 07a8573feef0053ec28b98355feba8c83dcfb3f99c2d0913a16a287382daf4b8  monolite-117-latest.tar.gz
-- 
1.9.1
