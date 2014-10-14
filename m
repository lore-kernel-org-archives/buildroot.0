From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:29:42 -0300
Subject: [Buildroot] [PATCH 2/2] xz: add hash file
In-Reply-To: <1413329382-25575-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329382-25575-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329382-25575-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xz/xz.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/xz/xz.hash

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
new file mode 100644
index 0000000..6169b83
--- /dev/null
+++ b/package/xz/xz.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	166c48d2842519bc4f96333bff9e265f8cdda44d38e40594ef3f9bbb52890490	xz-5.0.5.tar.bz2
-- 
2.0.4
