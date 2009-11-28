From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 28 Nov 2009 14:25:13 +0100
Subject: [Buildroot] [git commit master] docs/buildroot.html: fix minor typo
Message-ID: <20091128132800.27FCE777E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4f399c3fb1740a98709a9f98c4d57fc4435efa42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

STAGING_DIR is output/staging, not build/staging per default.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index a04348b..c4f191a 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -702,7 +702,7 @@ endif
      might be cumbersome.</p>
 
      <p>It is also possible to generate the Buildroot toolchain in
-     another directory than <code>build/staging</code> using the
+     another directory than <code>output/staging</code> using the
      <code>Build options -&gt; Toolchain and header file
      location</code> option. This could be useful if the toolchain
      must be shared with other users.</p>
-- 
1.6.3.3
