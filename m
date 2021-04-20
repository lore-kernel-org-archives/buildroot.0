From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:43 -0500
Subject: [Buildroot] [PATCH 22/25] package/rng-tools: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-22-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:rng-tools_project:rng-tools:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:rng-tools_project:rng-tools

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/rng-tools/rng-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 2d508413a4..658dc6e03b 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -11,6 +11,7 @@ RNG_TOOLS_LICENSE_FILES = COPYING
 RNG_TOOLS_DEPENDENCIES = host-pkgconf openssl
 # From git
 RNG_TOOLS_AUTORECONF = YES
+RNG_TOOLS_CPE_ID_VENDOR = rng-tools_project
 
 RNG_TOOLS_CONF_OPTS = --without-pkcs11
 
-- 
2.17.1
