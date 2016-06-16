From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:23:59 +0200
Subject: [Buildroot] [PATCH 09/13] package/erlang-p1-utils: add .hash file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-9-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-p1-utils tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-p1-utils/erlang-p1-utils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-p1-utils/erlang-p1-utils.hash

diff --git a/package/erlang-p1-utils/erlang-p1-utils.hash b/package/erlang-p1-utils/erlang-p1-utils.hash
new file mode 100644
index 0000000..c41e5ef
--- /dev/null
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9c7e9fa2990edd419953a6ae609ffed0b90e671b57c468d97c0d85d866d80210 erlang-p1-utils-1.0.3.tar.gz
-- 
2.5.5
