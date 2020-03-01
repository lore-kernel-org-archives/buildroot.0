From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Mar 2020 09:52:47 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/privoxy: bump to version 3.0.28
Message-ID: <20200301085247.4082863-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update indentation of hash file (two spaces)
- Add sha256 hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/privoxy/privoxy.hash | 7 ++++---
 package/privoxy/privoxy.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index 9cf08f1163..84daf5c611 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,5 +1,6 @@
-# From http://sourceforge.net/projects/ijbswa/files/Sources/3.0.26%20%28stable%29/
-md5 8a1c842112ccea68c19b7ceb4a0e999f  privoxy-3.0.26-stable-src.tar.gz
-sha1 b646624006225979f83453ba542e448667f45998  privoxy-3.0.26-stable-src.tar.gz
+# From http://sourceforge.net/projects/ijbswa/files/Sources/3.0.28%20%28stable%29/
+md5  c7e8900d5aff33d9a5fc37ac28154f21  privoxy-3.0.28-stable-src.tar.gz
+sha1  fa8f9f355a48afe94afcaef31c5404b2294c1043  privoxy-3.0.28-stable-src.tar.gz
 # Locally computed
+sha256  b5d78cc036aaadb3b7cf860e9d598d7332af468926a26e2d56167f1cb6f2824a  privoxy-3.0.28-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index df0e7372ac..f12d015efa 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 3.0.26
+PRIVOXY_VERSION = 3.0.28
 PRIVOXY_SITE = http://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
-- 
2.25.0
