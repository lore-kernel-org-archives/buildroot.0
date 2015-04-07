From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:28 -0300
Subject: [Buildroot] [PATCH 04/27] libiconv: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libiconv/libiconv.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libiconv/libiconv.hash

diff --git a/package/libiconv/libiconv.hash b/package/libiconv/libiconv.hash
new file mode 100644
index 0000000..83de76f
--- /dev/null
+++ b/package/libiconv/libiconv.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	72b24ded17d687193c3366d0ebe7cde1e6b18f0df8c55438ac95be39e8a30613	libiconv-1.14.tar.gz
-- 
2.0.5
