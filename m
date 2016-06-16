From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:24:03 +0200
Subject: [Buildroot] [PATCH 13/13] package/erlang-rebar: add .hash file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-13-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-rebar tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-rebar/erlang-rebar.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-rebar/erlang-rebar.hash

diff --git a/package/erlang-rebar/erlang-rebar.hash b/package/erlang-rebar/erlang-rebar.hash
new file mode 100644
index 0000000..029b52c
--- /dev/null
+++ b/package/erlang-rebar/erlang-rebar.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 aed933d4e60c4f11e0771ccdb4434cccdb9a71cf8b1363d17aaf863988b3ff60 erlang-rebar-2.6.1.tar.gz
-- 
2.5.5
