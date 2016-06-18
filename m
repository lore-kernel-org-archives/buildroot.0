From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 12:25:03 +0200
Subject: [Buildroot] [git commit] liblog4c-localtime: add .hash file
Message-ID: <20160618102656.82DAC81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c98bd962d337f1fade141cb604d311a9eed88bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/e54/e54afe2f5d27540d69e2b9c3b963e23fac5bb4f7/
http://autobuild.buildroot.org/results/e57/e57da53c15f4844b34353154720820aacc9e437a/

Similar to jquery-keyboard, it seems the liblog4c-localtime tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liblog4c-localtime/liblog4c-localtime.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/liblog4c-localtime/liblog4c-localtime.hash b/package/liblog4c-localtime/liblog4c-localtime.hash
new file mode 100644
index 0000000..2e4e641
--- /dev/null
+++ b/package/liblog4c-localtime/liblog4c-localtime.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 a1f68d8251509c0171f8bfea42f9e2a5255a4185f7dcbe67f584aa09709b2496  liblog4c-localtime-v1.0.tar.gz
