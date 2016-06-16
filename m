From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:23:53 +0200
Subject: [Buildroot] [PATCH 03/13] package/erlang-p1-cache-tab: add .hash
	file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-p1-cache-tab tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash

diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
new file mode 100644
index 0000000..d8b09f9
--- /dev/null
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 752b649f695e9f2777efd6b2d8dfdcc1f435104b4e363f5f0454b99fd009015c erlang-p1-cache-tab-1.0.1.tar.gz
-- 
2.5.5
