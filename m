From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:19 -0400
Subject: [Buildroot] [PATCH 01/19] package/acl: add hashes for license files
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/acl/acl.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/acl/acl.hash b/package/acl/acl.hash
index 091092a1c5..500976cee2 100644
--- a/package/acl/acl.hash
+++ b/package/acl/acl.hash
@@ -1,2 +1,7 @@
 # Locally calculated after checking pgp signature
 sha256  06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7  acl-2.2.53.tar.gz
+
+# Locally calculated
+sha256  a45a845012742796534f7e91fe623262ccfb99460a2bd04015bd28d66fba95b8  doc/COPYING
+sha256  01b1f9f2c8ee648a7a596a1abe8aa4ed7899b1c9e5551bda06da6e422b04aa55  doc/COPYING.LGPL
+
-- 
2.21.0
