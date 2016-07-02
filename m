From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat,  2 Jul 2016 07:06:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/valijson: indentation cleanup
In-Reply-To: <1467435987-15904-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1467435987-15904-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1467435987-15904-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/valijson/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/valijson/Config.in b/package/valijson/Config.in
index 4699378..10721b3 100644
--- a/package/valijson/Config.in
+++ b/package/valijson/Config.in
@@ -6,13 +6,13 @@ config BR2_PACKAGE_VALIJSON
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_REGEX
 	help
-	 Valijson is a header-only JSON Schema Validation library for
-	 C++. Valijson provides a simple validation API that allows
-	 you load JSON Schemas, and validate documents loaded by one
-	 of several supported parser libraries like boost, jsoncpp,
-	 rapidjson and picoJSON.
+	  Valijson is a header-only JSON Schema Validation library for
+	  C++. Valijson provides a simple validation API that allows
+	  you load JSON Schemas, and validate documents loaded by one
+	  of several supported parser libraries like boost, jsoncpp,
+	  rapidjson and picoJSON.
 
-	 https://github.com/tristanpenman/valijson
+	  https://github.com/tristanpenman/valijson
 
 comment "valijson needs a toolchain w/ C++, threads, wchar  support"
 	depends on !BR2_INSTALL_LIBSTDCPP  || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
1.9.1
