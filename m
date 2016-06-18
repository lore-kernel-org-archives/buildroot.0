From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:06:37 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-tls: add .hash file
Message-ID: <20160618131028.1C519818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d524ceb110cdcfe1ed2bd18c376c47fd6983fa37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the erlang-p1-tls tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to our
s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
new file mode 100644
index 0000000..fd8d801
--- /dev/null
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8e8b848a112ff6bf146df34b4f6bc50160a8858a18499a7a6124193b37237a40 erlang-p1-tls-1.0.0.tar.gz
