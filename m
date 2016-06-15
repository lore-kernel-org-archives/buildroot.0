From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 23:05:44 +0200
Subject: [Buildroot] [git commit] e2tools: add .hash file
Message-ID: <20160615210635.E086781898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c51b20755bdf7a49a176aa50aa88fcb7af698c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/008/008df073bfa99f93e27d977ef1b64b79ef8b34c4/
http://autobuild.buildroot.org/results/28f/28f0e730768bfaf9577069e4ab18b5a3f3e595a8/

Similar to jquery-keyboard, it seems the e2tools tarball on the autobuilder
is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2tools/e2tools.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/e2tools/e2tools.hash b/package/e2tools/e2tools.hash
new file mode 100644
index 0000000..4cec81e
--- /dev/null
+++ b/package/e2tools/e2tools.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 37bbd705170dff80720d68916f8d90803d71987e1b60f7149a285a7fcd539214  e2tools-3158ef18a903ca4a98b8fa220c9fc5c133d8bdf6.tar.gz
