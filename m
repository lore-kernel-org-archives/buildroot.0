From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:22:05 +0200
Subject: [Buildroot] [git commit] package/bzip2: add hash for license file
Message-ID: <20190602201236.8921F81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc7581a850fcae8de601b9678f65a00d46db76af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a standard sha256 hash for the package itself.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bzip2/bzip2.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bzip2/bzip2.hash b/package/bzip2/bzip2.hash
index 60b0a191ef..ffe94aa454 100644
--- a/package/bzip2/bzip2.hash
+++ b/package/bzip2/bzip2.hash
@@ -1,2 +1,6 @@
 # From http://www.bzip.org/downloads.html
 md5	00b516f4704d4a7cb50a1d97e6e8e15b	bzip2-1.0.6.tar.gz
+
+# Locally calculated
+sha256	a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd	bzip2-1.0.6.tar.gz
+sha256	4919cfb14a73cd64fcef67b107613970cf1659a09aa675dba31314f373bc7204	LICENSE
