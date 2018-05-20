From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 10:57:29 +0200
Subject: [Buildroot] [PATCH 1/1] liboauth: add hash for license file
Message-ID: <20180520085729.11314-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liboauth/liboauth.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/liboauth/liboauth.hash b/package/liboauth/liboauth.hash
index 6806a08f9f..5fa0353d50 100644
--- a/package/liboauth/liboauth.hash
+++ b/package/liboauth/liboauth.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  0df60157b052f0e774ade8a8bac59d6e8d4b464058cc55f9208d72e41156811f  liboauth-1.0.3.tar.gz
+sha256  c30608672733bf3abd2ccf6f3206be8d91b7ee58b007b2fdbcfbc61c655e7fb7  COPYING.MIT
-- 
2.14.1
