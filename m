From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:02:52 -0300
Subject: [Buildroot] [PATCH 01/16] diffutils: add hash file
Message-ID: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/diffutils/diffutils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/diffutils/diffutils.hash

diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
new file mode 100644
index 0000000..27eace2
--- /dev/null
+++ b/package/diffutils/diffutils.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	a25e89a8ab65fded1731e4186be1bb25cda967834b6df973599cdcd5abdfc19c	diffutils-3.3.tar.xz
-- 
2.0.5
