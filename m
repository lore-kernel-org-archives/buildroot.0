From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 12:06:41 +0200
Subject: [Buildroot] [git commit] libstrophe: add .hash file
Message-ID: <20160618100654.C2F3981D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=037563d5c90f1b623e182e8384eed920ddd104f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/847/847813211e29bdf8b986696ba5fd5d561e66ca2c/
http://autobuild.buildroot.org/results/b42/b420d52c49ab228f9599f9e03bb55ad3e4dd0fda/

Similar to jquery-keyboard, it seems the libstrophe tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libstrophe/libstrophe.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
new file mode 100644
index 0000000..d840303
--- /dev/null
+++ b/package/libstrophe/libstrophe.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 08f4a85ef419a8bdf08b6afa8f7b2a0e5e180fdc9c16cede81af672ec10e21e7  libstrophe-0.8.8.tar.gz
+sha256 00936397cbb75ef168992868ae559b141b505d3a06f08163012b240390efa553  b08766c8e46956daba010044b00c97f78b598780.patch
