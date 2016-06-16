From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:23:56 +0200
Subject: [Buildroot] [PATCH 06/13] package/erlang-p1-stringprep: add .hash
	file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-6-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-p1-stringprep tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-p1-stringprep/erlang-p1-stringprep.hash

diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
new file mode 100644
index 0000000..23bc6fb
--- /dev/null
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5a74277e7bfb18b8f35838fa78fcde83f0acdb5b2a5b90c4b6d2470a33f7911e erlang-p1-stringprep-1.0.0.tar.gz
-- 
2.5.5
