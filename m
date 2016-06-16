From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jun 2016 23:23:52 +0200
Subject: [Buildroot] [PATCH 02/13] package/erlang-lager: add .hash file
In-Reply-To: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
References: <1466112243-17982-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466112243-17982-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the erlang-lager tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/erlang-lager/erlang-lager.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/erlang-lager/erlang-lager.hash

diff --git a/package/erlang-lager/erlang-lager.hash b/package/erlang-lager/erlang-lager.hash
new file mode 100644
index 0000000..e436fdc
--- /dev/null
+++ b/package/erlang-lager/erlang-lager.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 168a8e48646b04bcee1ab0c97c1ff63563bd7fd25638f1504b8d8f674d2ddd1b erlang-lager-2.2.0.tar.gz
-- 
2.5.5
