From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 12 Mar 2015 21:07:22 +0100
Subject: [Buildroot] [PATCH] at: Add hash file
Message-ID: <5501F1FA.1030301@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/at/at.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/at/at.hash

diff --git a/package/at/at.hash b/package/at/at.hash
new file mode 100644
index 0000000..481c937
--- /dev/null
+++ b/package/at/at.hash
@@ -0,0 +1,4 @@
+# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.13-2%2Bdeb7u1.dsc
+sha1	9873e0c38403ef58364912d0b505fd20798fd400  at_3.1.13.orig.tar.gz
+sha256	3a8b90868d615d21a92f4986ea9a823886329af8fae8dd7ab4eed9b273bca072  at_3.1.13.orig.tar.gz
+md5	1da61af6c29e323abaaf13ee1a8dad79  at_3.1.13.orig.tar.gz
-- 
1.9.1
