From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Nov 2009 20:43:42 +0100
Subject: [Buildroot] [git commit master] docs/lists.html: adapt google
	search for lists.busybox.net
Message-ID: <20091115194419.CDB70777AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cfccdd350a6034ddd4e33bf9e35e054156c124df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Gordon Smith on the ml.

The mailing list archives are accessed through lists.busybox.net since
the move to osuosl. Adapt the google search box to match.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/lists.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/lists.html b/docs/lists.html
index 21ae8f5..31d47d4 100644
--- a/docs/lists.html
+++ b/docs/lists.html
@@ -22,8 +22,8 @@ list with frequently asked questions...
 
 <center>
 <form method="GET" action="http://www.google.com/custom">
-<input type="hidden" name="domains" value="buildroot.uclibc.org">
-<input type="hidden" name="sitesearch" value="buildroot.uclibc.org">
+<input type="hidden" name="domains" value="lists.busybox.net">
+<input type="hidden" name="sitesearch" value="lists.busybox.net">
 <input type="text" name="q" size="31" maxlength="255" value="">
 <br>
 <input type="submit" name="sa" value="search the mailing list archives">
-- 
1.6.3.3
