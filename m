From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 09:52:11 +0100
Subject: [Buildroot] [git commit] prboom: Use lowercase for kconfig option
	text
Message-ID: <20141214165629.3BB2580412@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11fcf9986ea997f90bf5666f6d04aaaf8dad3d7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like elsewhere in Buildroot.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prboom/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/prboom/Config.in b/package/prboom/Config.in
index 2835929..678a151 100644
--- a/package/prboom/Config.in
+++ b/package/prboom/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_PRBOOM
-	bool "PrBoom"
+	bool "prboom"
 	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_SDL_MIXER
 	select BR2_PACKAGE_SDL_NET
