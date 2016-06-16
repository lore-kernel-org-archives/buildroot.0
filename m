From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:23:54 +0200
Subject: [Buildroot] [PATCH 04/13] package/erlang-p1-iconv: add .hash file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-4-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-p1-iconv tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-p1-iconv/erlang-p1-iconv.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-p1-iconv/erlang-p1-iconv.hash

diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.hash b/package/erlang-p1-iconv/erlang-p1-iconv.hash
new file mode 100644
index 0000000..a284189
--- /dev/null
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3ef1fb814fdf23e8ad8a210efb66681fa67cd42753be536521bf9686158880d3 erlang-p1-iconv-0.9.0.tar.gz
-- 
2.5.5
