From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jul 2014 23:40:55 +0200
Subject: [Buildroot] [git commit] package/ca-certificates: add tarball's
	hashes
Message-ID: <20140704215108.1C85C9D181@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b2264d3d4a0c53917c6f64ae1d7e10b613e59de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ca-certificates contains sensitive security-related information,
and we want to ensure the archive that we download has not been
compromised.

Add the sha1 and sha256 hashes from Debian's packaging.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Martin Bark <martin@barkynet.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ca-certificates/ca-certificates.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
new file mode 100644
index 0000000..bcd0723
--- /dev/null
+++ b/package/ca-certificates/ca-certificates.hash
@@ -0,0 +1,3 @@
+# hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
+sha1   ad57a45f0422fafd78a2e8191e5204f2306cc91b                         ca-certificates_20140223.tar.xz
+sha256 815b7cd97200b0d76450bb3e7d9b65997ac494ab6467b17369f65b2ef94bcb0c ca-certificates_20140223.tar.xz
