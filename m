From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Apr 2011 22:21:47 +0200
Subject: [Buildroot] [git commit] docs: add favicon / robots.txt
Message-ID: <20110404202245.27FC58190F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b90b9cc70a88c52ed618ed2fb15853a779b3bbd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the past, these files of the buildroot website weren't under git
version control, but rather were static files added to the git checkout
used by the webserver.

This is no longer the case, so add them to git - And at the same time
use the Buildroot logo for the favicon, rather than reusing the busybox
one.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/favicon.ico |  Bin 0 -> 2238 bytes
 docs/robots.txt  |    2 ++
 2 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 docs/favicon.ico
 create mode 100644 docs/robots.txt

diff --git a/docs/favicon.ico b/docs/favicon.ico
new file mode 100644
index 0000000..fa9d240
Binary files /dev/null and b/docs/favicon.ico differ
diff --git a/docs/robots.txt b/docs/robots.txt
new file mode 100644
index 0000000..1b425ee
--- /dev/null
+++ b/docs/robots.txt
@@ -0,0 +1,2 @@
+User-agent: *
+Disallow: /cgi-bin/
-- 
1.7.3.4
