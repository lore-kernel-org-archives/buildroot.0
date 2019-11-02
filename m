From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 22:16:08 +0100
Subject: [Buildroot] [git commit] package/grantlee: add hash for license file
Message-ID: <20191102210929.3B8848E518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1256aa96a83e3cd6e4d367332fe7b0b90f1523d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grantlee/grantlee.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/grantlee/grantlee.hash b/package/grantlee/grantlee.hash
index cdff778041..2be423bd95 100644
--- a/package/grantlee/grantlee.hash
+++ b/package/grantlee/grantlee.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256  ea2e402466c74bb533eee2c7252209ec61cd93a5d236fecd625b4a0eb13a1478    grantlee-5.1.0.tar.gz
+
+# Hash for license file
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861    COPYING.LIB
