From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jun 2010 23:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] docs: fix git-over-http
	description
Message-ID: <20100621210812.D6818817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f63440cc43af946c8ff4de0b07849918d01feb43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This has now finally been setup.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/git.html |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/docs/git.html b/docs/git.html
index 8820981..111a29a 100644
--- a/docs/git.html
+++ b/docs/git.html
@@ -13,7 +13,12 @@ git clone git://git.buildroot.net/buildroot</pre>
 Or if you're behind a firewall blocking git:
 
 <pre>
-git clone http://git.buildroot.net/buildroot</pre>
+git clone http://git.buildroot.net/git/buildroot.git</pre>
+
+<p>
+
+Please use the native git protocol if at all possible, as it's a lot
+more efficient than HTTP.
 
 <p>
 
-- 
1.7.1
