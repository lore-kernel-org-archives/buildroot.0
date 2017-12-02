From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 16:57:26 +0100
Subject: [Buildroot] [PATCH 1/1] tinydtls: add hash for license file
Message-ID: <20171202155726.30577-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinydtls/tinydtls.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinydtls/tinydtls.hash b/package/tinydtls/tinydtls.hash
index 909c8d16f..66644df7a 100644
--- a/package/tinydtls/tinydtls.hash
+++ b/package/tinydtls/tinydtls.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	ccf6d8fbae03fb2e0ba32878ed8e57d8b4f73538b1064df90a3e764da5fac010	tinydtls-0.8.2.tar.gz
+sha256	65fbf31c3551633e7dcc051fac80f2c1a73b0b077af9ed564d726155dfc40513	tinydtls.h
-- 
2.14.1
