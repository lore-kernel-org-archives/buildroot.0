From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 21:44:28 +0200
Subject: [Buildroot] [git commit] pkgconf: update upstream URL in Config.in
Message-ID: <20170919193719.7A5C2801E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13cb944aab01daf1683c466233a997afd749aa9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The download location got changed two years ago when the version was bumped
to 0.9.12, but the upstream URL in Config.in wasn't updated.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkgconf/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkgconf/Config.in b/package/pkgconf/Config.in
index f95847f..9d5d9ab 100644
--- a/package/pkgconf/Config.in
+++ b/package/pkgconf/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PKGCONF
 	  but was written from scratch in the summer of 2011 to replace
 	  pkg-config, which now needs itself to build itself
 
-	  https://github.com/nenolod/pkgconf
+	  https://github.com/pkgconf/pkgconf
