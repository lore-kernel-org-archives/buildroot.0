From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:05:16 +0200
Subject: [Buildroot] [git commit] package/lua-ev: add .hash file
Message-ID: <20160618211721.0D98581963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15147250fb3003c1f46dfad1fe182cbb95391a30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the lua-ev tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-ev/lua-ev.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lua-ev/lua-ev.hash b/package/lua-ev/lua-ev.hash
new file mode 100644
index 0000000..522e7e7
--- /dev/null
+++ b/package/lua-ev/lua-ev.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f7f5df5ecfe4bd54797261d1b1bd3f770d39128b7aba72deef6d1d8d8e2b53fe  lua-ev-v1.4.tar.gz
