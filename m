From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:23:58 +0200
Subject: [Buildroot] [PATCH 08/13] package/erlang-p1-tls: add .hash file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-8-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-p1-tls tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-p1-tls/erlang-p1-tls.hash

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
new file mode 100644
index 0000000..fd8d801
--- /dev/null
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8e8b848a112ff6bf146df34b4f6bc50160a8858a18499a7a6124193b37237a40 erlang-p1-tls-1.0.0.tar.gz
-- 
2.5.5
