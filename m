From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 11 Aug 2019 20:26:39 +0200
Subject: [Buildroot] [PATCH] package/mpg123: fix hash
Message-ID: <1565547999-23811-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When bumping to version 1.25.11, an incorrect hash was set.

Fixes:
 - http://autobuild.buildroot.net/results/454/454bc42053deb84a73ed75dda99ae9015d23da84/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/mpg123/mpg123.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 687662b..edb916e 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -2,6 +2,6 @@
 sha1 25f3e8f8599d3ffc480858799ea6f8620f48543d  mpg123-1.25.11.tar.bz2
 md5 64749512a6fdc117227abe13fee4cc36  mpg123-1.25.11.tar.bz2
 # Locally calculated
-sha256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855  mpg123-1.25.11.tar.bz2
+sha256 df063307faa27c7d9efe63d2139b1564cfc7cdbb7c6f449c89ef8faabfa0eab2  mpg123-1.25.11.tar.bz2
 # License file
 sha256  f40e0dd86b27b52e429b693a87b3ca63ae0a98a4d142e77207aa6bdf1db7a295  COPYING
-- 
2.7.4
