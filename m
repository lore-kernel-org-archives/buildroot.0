From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:02:55 -0300
Subject: [Buildroot] [PATCH 04/16] libgpg-error: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgpg-error/libgpg-error.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libgpg-error/libgpg-error.hash

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
new file mode 100644
index 0000000..76aff5d
--- /dev/null
+++ b/package/libgpg-error/libgpg-error.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	fa6fbf315efa33a943751e3c4d04ea3d41ddf4bdee5727de3c0978277d52923b	libgpg-error-1.12.tar.gz
-- 
2.0.5
