From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Mar 2014 18:51:46 +0100
Subject: [Buildroot] [PATCH 13/13] package/ca-certificates: add tarball's
	hashes
In-Reply-To: <cover.1393781649.git.yann.morin.1998@free.fr>
References: <cover.1393781649.git.yann.morin.1998@free.fr>
Message-ID: <2fc95a3d21ec0c3a60b7209f85ffc8d2f9dffc45.1393781650.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

ca-certificates contains sensitive security-related information,
and we want to ensure the archive that we download has not been
compromised.

Add the sha1 and sha256 hashes from Debian's packaging.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Martin Bark <martin@barkynet.com>
---
 package/ca-certificates/ca-certificates.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/ca-certificates/ca-certificates.hash

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
new file mode 100644
index 0000000..13b0c30
--- /dev/null
+++ b/package/ca-certificates/ca-certificates.hash
@@ -0,0 +1,3 @@
+# sha1 and sha256 from: $(CA_CERTIFICATES_SITE)/ca-certificates_20130906.dsc :
+7f197c1bf7c7fc82e9f8f2fec6d8cc65f6a6187b                         ca-certificates_20130906.tar.gz
+dd10520091d469e95e11e5fafb7422d3be0a66071984d09009ed3e0232cb277d ca-certificates_20130906.tar.gz
-- 
1.8.3.2
