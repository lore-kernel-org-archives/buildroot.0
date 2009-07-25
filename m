From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jul 2009 09:13:44 +0200
Subject: [Buildroot] [git commit] midori: remove configuration comment on
	X.org dependency
Message-ID: <20090725071548.60A1C77713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=958f2d5fa338c035cce8d29e009c08fd3e158364
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency of Midori on X.org should be pretty obvious to the
user, and we don't want to unnecessarly clutter the configuration
interface with comments.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/midori/Config.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index fd1da35..80b7f77 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -7,6 +7,3 @@ config BR2_PACKAGE_MIDORI
 	  Midori is a lightweight web browser based on WebKit
 
 	  http://software.twotoasts.de/?page=midori
-
-comment "midori		- disabled (requires Xorg(7))"
-	depends on !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
-- 
1.6.3.3
