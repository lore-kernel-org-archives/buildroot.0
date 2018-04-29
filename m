From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 12:16:16 +0200
Subject: [Buildroot] [PATCH 1/1] libasplib: add hash for license file
Message-ID: <20180429101616.19043-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libasplib/libasplib.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libasplib/libasplib.hash b/package/libasplib/libasplib.hash
index 76534e528d..db8e920334 100644
--- a/package/libasplib/libasplib.hash
+++ b/package/libasplib/libasplib.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 68e117348fa17592dde7672477e927119a0e477103ced1d3a57d92e30880a147  libasplib-be7fac89218a84b75f7598e3d76625ece99296f2.tar.gz
+sha256 12ac5047f2af0522f06798b1589ffc4599bc29c91f954d7874e0320634e777c0  LICENSE
-- 
2.14.1
