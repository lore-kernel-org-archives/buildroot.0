From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:25 +0200
Subject: [Buildroot] [git commit] package/erlang-lager: add .hash file
Message-ID: <20160618131027.60E36817FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e249bd18482052aac685427c648a73daba774aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-lager tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-lager/erlang-lager.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-lager/erlang-lager.hash b/package/erlang-lager/erlang-lager.hash
new file mode 100644
index 0000000..e436fdc
--- /dev/null
+++ b/package/erlang-lager/erlang-lager.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 168a8e48646b04bcee1ab0c97c1ff63563bd7fd25638f1504b8d8f674d2ddd1b erlang-lager-2.2.0.tar.gz
