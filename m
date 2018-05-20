From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 16:30:21 +0200
Subject: [Buildroot] [PATCH 1/1] libpam-radius-auth: add hash for license
 file
Message-ID: <20180520143021.13516-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpam-radius-auth/libpam-radius-auth.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libpam-radius-auth/libpam-radius-auth.hash b/package/libpam-radius-auth/libpam-radius-auth.hash
index ffd7404df3..3e8dc02558 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.hash
+++ b/package/libpam-radius-auth/libpam-radius-auth.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking PGP signature
 sha256	  742d79fc39824726c098e746bd3dc3484f983f5ee082c621c1e848b2c3725305	pam_radius-1.4.0.tar.gz
+
+# Hash for license file:
+sha256	  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34	LICENSE
-- 
2.14.1
