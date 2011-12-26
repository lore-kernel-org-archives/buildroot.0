From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Dec 2011 08:19:13 +0100
Subject: [Buildroot] [git commit] git.html: fix cgit link
Message-ID: <20111226071932.9ECB98FDD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24c80c9bfdac00e185b9239a43c2e897d4763cd3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's an issue with the cgit installation, which causes
git.buildroot.net/buildroot (no trailing /) requests to return stale
results. The osuosl people are looking into it, but until then atleast
use the the correct URL on the website link.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/git.html |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/git.html b/docs/git.html
index 111a29a..bf894b9 100644
--- a/docs/git.html
+++ b/docs/git.html
@@ -4,7 +4,7 @@
 <h3>Git Access</h3>
 
 The buildroot repository can be browsed online through cgit at
-<a href="http://git.buildroot.net/buildroot">http://git.buildroot.net/buildroot</a>.
+<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
 To grab a copy of the repository use
 
 <pre>
