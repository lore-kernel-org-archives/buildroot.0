From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 May 2018 11:44:46 +0200
Subject: [Buildroot] [git commit] libical: add hash for license file
Message-ID: <20180501094623.8F5D48A556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f177e3338b6262c6ba4b1c6ae5b304fcb8b281d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libical/libical.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libical/libical.hash b/package/libical/libical.hash
index 5c42cdcc61..7edb29bd28 100644
--- a/package/libical/libical.hash
+++ b/package/libical/libical.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	089ce3c42d97fbd7a5d4b3c70adbdd82115dd306349c1f5c46a8fb3f8c949592	libical-1.0.1.tar.gz
+sha256	c393726f82e6f21df5262110215f6a4382b32046d10afdcfcc49338aa7a191f2	LICENSE
