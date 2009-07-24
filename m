From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2009 23:30:06 +0200
Subject: [Buildroot] [PATCH 05/13] midori: remove configuration comment on
	X.org dependency
In-Reply-To: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
Message-ID: <958f2d5fa338c035cce8d29e009c08fd3e158364.1248471011.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.6.0.4
