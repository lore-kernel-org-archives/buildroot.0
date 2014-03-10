From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 21:51:44 +0100
Subject: [Buildroot] [PATCH 12/12] package/ca-certificates: add tarball's
	hashes
In-Reply-To: <cover.1394484283.git.yann.morin.1998@free.fr>
References: <cover.1394484283.git.yann.morin.1998@free.fr>
Message-ID: <985eb7379f1347835b44d685bbcef295fea730c5.1394484283.git.yann.morin.1998@free.fr>
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
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/ca-certificates/ca-certificates.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/ca-certificates/ca-certificates.hash

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
new file mode 100644
index 0000000..06023d7
--- /dev/null
+++ b/package/ca-certificates/ca-certificates.hash
@@ -0,0 +1,3 @@
+# hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_20130906.dsc :
+sha1   7f197c1bf7c7fc82e9f8f2fec6d8cc65f6a6187b                         ca-certificates_20130906.tar.gz
+sha256 dd10520091d469e95e11e5fafb7422d3be0a66071984d09009ed3e0232cb277d ca-certificates_20130906.tar.gz
-- 
1.8.3.2
