From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:39 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-utils: add .hash file
Message-ID: <20160618131028.3C146818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3b6eb1b92c58b6c358f323b7798ce2e1b06e59c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-p1-utils tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-utils/erlang-p1-utils.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-p1-utils/erlang-p1-utils.hash b/package/erlang-p1-utils/erlang-p1-utils.hash
new file mode 100644
index 0000000..c41e5ef
--- /dev/null
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9c7e9fa2990edd419953a6ae609ffed0b90e671b57c468d97c0d85d866d80210 erlang-p1-utils-1.0.3.tar.gz
