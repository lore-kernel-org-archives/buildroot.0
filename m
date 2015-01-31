From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Jan 2015 15:10:47 +0100
Subject: [Buildroot] [git commit] perl: add hash for the perl-cross file
Message-ID: <20150131141132.041218014E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7088eb6f5eb9cd74291a0f01a000fb4af3691235
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix:
  WARNING: No hash found for perl-5.20.1-cross-0.9.4.tar.gz

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 57fefd7..f287eaa 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -2,3 +2,6 @@
 md5    ede5166f949d9a07163bc5b086be9759                                 perl-5.20.1.tar.bz2
 sha1   cd424d1520ba2686fe5d4422565aaf880e9467f6                         perl-5.20.1.tar.bz2
 sha256 ede5ded37e7fb6139b04728cfca826f17076f9888dbfd100a56834dbeb04657c perl-5.20.1.tar.bz2
+
+# No upstream hashes for the following
+sha256 614f320d45042ca179a15ec88c6a15ff68e6f36fb004ee89efa71e42bda1dead perl-5.20.1-cross-0.9.4.tar.gz
