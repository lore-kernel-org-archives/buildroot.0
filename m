From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 Apr 2012 22:50:30 +0200
Subject: [Buildroot] [git commit] tinyhttpd: fix white space issue in
	Config.in
Message-ID: <20120403205317.DFF43969F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9afba4fdc672662c39f088b51c2ee939679d51a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tinyhttpd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tinyhttpd/Config.in b/package/tinyhttpd/Config.in
index eb60163..5a6ee88 100644
--- a/package/tinyhttpd/Config.in
+++ b/package/tinyhttpd/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_TINYHTTPD
 	help
 	  A relatively simple webserver written as a school project. It is
 	  exceedingly simple, threaded and handles basic CGI scripts.
-		
+
 	  http://sourceforge.net/projects/tinyhttpd/
