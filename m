From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 12:15:50 +0200
Subject: [Buildroot] [git commit] package/valijson: indentation cleanup
Message-ID: <20160702101617.2904281972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7f4d933b1c2e469a07b0212a50ac829ab51634f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
