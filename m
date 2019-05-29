From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:20 -0400
Subject: [Buildroot] [PATCH 02/19] package/attr: add hashes for license files
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
-- 
2.21.0
