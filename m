From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:23:55 +0200
Subject: [Buildroot] [PATCH 05/13] package/erlang-p1-sip: add .hash file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-5-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-p1-sip tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-p1-sip/erlang-p1-sip.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-p1-sip/erlang-p1-sip.hash

diff --git a/package/erlang-p1-sip/erlang-p1-sip.hash b/package/erlang-p1-sip/erlang-p1-sip.hash
new file mode 100644
index 0000000..74382cc
--- /dev/null
+++ b/package/erlang-p1-sip/erlang-p1-sip.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2d6dfad997931668eb83a0cb127ccca8c51f8a383d76f9dea393c0b3a4eabae7 erlang-p1-sip-1.0.0.tar.gz
-- 
2.5.5
