From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:20:43 +0200
Subject: [Buildroot] [git commit] package/acl: add hashes for license files
Message-ID: <20190602201236.79CB181354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbf9132734de6db9b63dae0746aeab6e180479ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acl/acl.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/acl/acl.hash b/package/acl/acl.hash
index 091092a1c5..50c32d7734 100644
--- a/package/acl/acl.hash
+++ b/package/acl/acl.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256  06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7  acl-2.2.53.tar.gz
+
+# Locally calculated
+sha256  a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  doc/COPYING
+sha256  01b1f9f2c8ee648a7a596a1abe8aa4ed7899b1c9e5551bda06da6e422b04aa55  doc/COPYING.LGPL
