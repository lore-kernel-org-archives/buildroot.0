From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 19:32:05 +0100
Subject: [Buildroot] [git commit] package/mpd: fix typo
Message-ID: <20141209183214.364E180165@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d40147d9950d34057b7545c61ba43ccbf0c12278
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix little type: it's UPnP, not UPnp.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1d38b1a..4097f52 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -279,7 +279,7 @@ config BR2_PACKAGE_MPD_TCP
 	  on different machines (the usual scenario).
 
 config BR2_PACKAGE_MPD_UPNP
-	bool "UPnp"
+	bool "UPnP"
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBUPNP
 	help
