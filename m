From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 10:25:30 +0100
Subject: [Buildroot] [git commit] header.html: fixup cgit link
Message-ID: <20120131092709.E211890963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14e9f44c07fba19b621cb21f3a72f47193ae3a94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The strange caching issue still not resolved, so atleast make sure we're
using the working variant.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/header.html |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/header.html b/docs/header.html
index c8cb135..c9dcf31 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -49,7 +49,7 @@
     <br><a href="/about.html">About</a>
     <br><a href="/news.html">Latest News</a>
     <br><a href="/download.html">Download</a>
-    <br><a href="http://git.buildroot.net/buildroot">Browse Source</a>
+    <br><a href="http://git.buildroot.net/buildroot/">Browse Source</a>
     <br><a href="/git.html">Accessing Source</a>
     <br><a href="https://bugs.uclibc.org/">Bug Tracking</a>
     <br><a href="/docs.html">Documentation</a>
