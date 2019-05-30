From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:20:53 +0200
Subject: [Buildroot] [git commit branch/next] package/attr: add hashes for
 license files
Message-ID: <20190530223346.5E2418E72C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc9257abac73d75100bfae987ce4056571dda640
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/attr/attr.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/attr/attr.hash b/package/attr/attr.hash
index 88adf44e6a..ba9f45669f 100644
--- a/package/attr/attr.hash
+++ b/package/attr/attr.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256  5ead72b358ec709ed00bbf7a9eaef1654baad937c001c044fe8b74c57f5324e7  attr-2.4.48.tar.gz
+
+# Locally calculated
+sha256  98f318493be6b08bff3cd295791cde06c54e17882a3c74a1ed245eaa02533d52  doc/COPYING
+sha256  5decad7e58d90d44335bf2f45ce27563bd911065c6a1a02dfa7647c4efee75c8  doc/COPYING.LGPL
