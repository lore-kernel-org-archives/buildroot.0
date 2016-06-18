From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:56:04 +0200
Subject: [Buildroot] [git commit] package/libcli: add .hash file
Message-ID: <20160618205843.A82D681976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9914fa91b35d3e8b6354b80df780faddab44f434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the libcli tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcli/libcli.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcli/libcli.hash b/package/libcli/libcli.hash
new file mode 100644
index 0000000..f6ea12a
--- /dev/null
+++ b/package/libcli/libcli.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3c801cb0112b6b5e07bdc3b98c034b36df6f33a8ed95ce74520b704bdbc0f36d  libcli-c63c9d35144939c8b4fa3c5394aed2e29ff517b0.tar.gz
