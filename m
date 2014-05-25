From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 22:39:42 +0200
Subject: [Buildroot] [git commit] xbmc: Add missing unicode properties
	supports
Message-ID: <20140525204125.D4CA29CD68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efaeae52eb996e1c37cf6d51f471355dcd17faac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At startup, XBMC complains that PCRE is lacking unicode properties
supports.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xbmc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 75666a4..4db7378 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -39,6 +39,7 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UCP
 	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_BSDDB
 	select BR2_PACKAGE_PYTHON_BZIP2
