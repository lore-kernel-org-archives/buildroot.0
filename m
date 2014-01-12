From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2014 00:44:49 +0100
Subject: [Buildroot] [PATCH 6/6] package/ca-certificates: add tarball's hash
In-Reply-To: <cover.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <6c920feeb43c276de633d1a1724e47f96b97b6b0.1389569992.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

ca-certificates contains sensitive security-related information,
and we want to ensure the archive that we download has not been
compromised.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Martin Bark <martin@barkynet.com>
---
 package/ca-certificates/ca-certificates.hash | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 package/ca-certificates/ca-certificates.hash

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
new file mode 100644
index 0000000..6bc31e6
--- /dev/null
+++ b/package/ca-certificates/ca-certificates.hash
@@ -0,0 +1 @@
+7f197c1bf7c7fc82e9f8f2fec6d8cc65f6a6187b  ca-certificates_20130906.tar.gz
-- 
1.8.1.2
