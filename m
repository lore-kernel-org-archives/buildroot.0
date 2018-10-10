From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 08:58:24 +0200
Subject: [Buildroot] [git commit] lua-*: fix upstream URL in Config.in
Message-ID: <20181010065715.A274981E48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1f9882088786600445e0c6da38dc35f87af286b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

like in https://git.busybox.net/buildroot/commit/?id=05200ad01434ce297a166c6e1bebc8196c18f7dc

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-coat/Config.in           | 2 +-
 package/lua-coatpersistent/Config.in | 2 +-
 package/lua-csnappy/Config.in        | 2 +-
 package/lua-messagepack/Config.in    | 2 +-
 package/lua-testmore/Config.in       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lua-coat/Config.in b/package/lua-coat/Config.in
index f6ba6cf684..fa7aed90ac 100644
--- a/package/lua-coat/Config.in
+++ b/package/lua-coat/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LUA_COAT
 	help
 	  Yet Another Lua Object-Oriented Model
 
-	  http://fperrad.github.io/lua-Coat/
+	  https://fperrad.frama.io/lua-Coat/
diff --git a/package/lua-coatpersistent/Config.in b/package/lua-coatpersistent/Config.in
index d8b3570c13..049a0bc2a6 100644
--- a/package/lua-coatpersistent/Config.in
+++ b/package/lua-coatpersistent/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LUA_COATPERSISTENT
 	help
 	  An ORM for lua-Coat.
 
-	  http://fperrad.github.io/lua-CoatPersistent/
+	  https://fperrad.frama.io/lua-CoatPersistent/
 
 comment "lua-coatpersistent needs lsqlite3 or luasql-sqlite3"
 	depends on !BR2_PACKAGE_LSQLITE3 && !BR2_PACKAGE_LUASQL_SQLITE3
diff --git a/package/lua-csnappy/Config.in b/package/lua-csnappy/Config.in
index 54d68a2e1f..fb00a1300a 100644
--- a/package/lua-csnappy/Config.in
+++ b/package/lua-csnappy/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUA_CSNAPPY
 	  lua-csnappy is a binding of the csnappy library
 	  which implements the Google's Snappy (de)compressor.
 
-	  http://fperrad.github.io/lua-csnappy/
+	  https://fperrad.frama.io/lua-csnappy/
diff --git a/package/lua-messagepack/Config.in b/package/lua-messagepack/Config.in
index 2dab316a8d..7ec098f9a9 100644
--- a/package/lua-messagepack/Config.in
+++ b/package/lua-messagepack/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUA_MESSAGEPACK
 	  A pure Lua implementation of the MessagePack serialization
 	  format.
 
-	  http://fperrad.github.io/lua-MessagePack/
+	  https://fperrad.frama.io/lua-MessagePack/
diff --git a/package/lua-testmore/Config.in b/package/lua-testmore/Config.in
index 61dea3a6ee..3cbed38407 100644
--- a/package/lua-testmore/Config.in
+++ b/package/lua-testmore/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LUA_TESTMORE
 	help
 	  an Unit Testing Framework.
 
-	  http://fperrad.github.io/lua-TestMore/
+	  https://fperrad.frama.io/lua-TestMore/
