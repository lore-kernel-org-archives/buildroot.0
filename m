From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 13:46:27 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/mpg123: fix hash
Message-ID: <20190902114315.80706805AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=812fea06e797c23896112cb22a5ecb8427cb8915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

When bumping to version 1.25.11, an incorrect hash was set.

Fixes:
 - http://autobuild.buildroot.net/results/454/454bc42053deb84a73ed75dda99ae9015d23da84/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 900de6e41b9d30197c091fcbea13f8ca1fa6caf3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 687662b4cf..edb916ee73 100644
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
