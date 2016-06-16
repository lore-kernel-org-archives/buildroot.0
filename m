From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:24:00 +0200
Subject: [Buildroot] [PATCH 10/13] package/erlang-p1-xml: add .hash file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-10-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-p1-xml tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-p1-xml/erlang-p1-xml.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-p1-xml/erlang-p1-xml.hash

diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-p1-xml/erlang-p1-xml.hash
new file mode 100644
index 0000000..8e4a79f
--- /dev/null
+++ b/package/erlang-p1-xml/erlang-p1-xml.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4c163c5b9572baa93eb97e03544db57dc751c7995a5279081a0d56f5fdaa2521 erlang-p1-xml-1.1.1.tar.gz
-- 
2.5.5
