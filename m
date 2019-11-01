From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  1 Nov 2019 11:59:06 +0100
Subject: [Buildroot] [PATCH 2/2] package/grantlee: add hash for license file
In-Reply-To: <20191101105906.21219-1-fontaine.fabrice@gmail.com>
References: <20191101105906.21219-1-fontaine.fabrice@gmail.com>
Message-ID: <20191101105906.21219-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.23.0
