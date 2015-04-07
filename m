From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:26 -0300
Subject: [Buildroot] [PATCH 02/27] libffi: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libffi/libffi.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libffi/libffi.hash

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
new file mode 100644
index 0000000..4c25fd3
--- /dev/null
+++ b/package/libffi/libffi.hash
@@ -0,0 +1,2 @@
+# From ftp://sourceware.org/pub/libffi/sha512.sum
+sha512	8994973d75facf5ad928c270e17b1a56e24d1543af75b93731a0048e747df27e4190a736b6dc2dca7d43de1d7e88891220304802c10fcccdcebee9c9ffd3d1b9	libffi-3.1.tar.gz
-- 
2.0.5
