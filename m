From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:27:42 +0200
Subject: [Buildroot] [git commit] librtlsdr: add .hash file
Message-ID: <20160616202900.C2D61820F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa4f27edd81a00061e35e53093ef9036d48af61d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/2a0/2a0e3d64aa1a9a8aaf019c411377b2f4e3c51aae/
http://autobuild.buildroot.org/results/c81/c814311099ff930c961e637b843a8591e8826b75/

Similar to jquery-keyboard, it seems the librtlsdr tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librtlsdr/librtlsdr.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/librtlsdr/librtlsdr.hash b/package/librtlsdr/librtlsdr.hash
new file mode 100644
index 0000000..24bca46
--- /dev/null
+++ b/package/librtlsdr/librtlsdr.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 98fb5c34ac94d6f2235a0bb41a08f8bed7949e1d1b91ea57a7c1110191ea58de  librtlsdr-v0.5.3.tar.gz
