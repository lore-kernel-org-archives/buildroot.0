From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 09:02:14 +0200
Subject: [Buildroot] [git commit] libllcp: add .hash file
Message-ID: <20160616070304.8AD5F818D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55bf6034d440ccc91c7d7c914dbc040c8264b6bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/d15/d157e77cf948d036a9e36e67534f7b442c0e8bf4/

Similar to jquery-keyboard, it seems the libllcp tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libllcp/libllcp.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libllcp/libllcp.hash b/package/libllcp/libllcp.hash
new file mode 100644
index 0000000..47c909f
--- /dev/null
+++ b/package/libllcp/libllcp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4336533304a11ecb3041d211ccecd7759b7c7aad4f44037721803e2da1094d22  libllcp-05dfa8003433a7070bfd8ae02efdb0203bbf34aa.tar.gz
