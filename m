From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Feb 2012 09:55:31 +0100
Subject: [Buildroot] [git commit] libevas: software buffer backend doesn't
	need X11
Message-ID: <20120208133907.41C0D90391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1231afc0190d6dbb0d1ed704637b70ff50d2927
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index 3afba1b..4615749 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -47,7 +47,6 @@ comment "libevas backends"
 
 config BR2_PACKAGE_LIBEVAS_BUFFER
 	bool "libevas buffer backend"
-	depends on BR2_PACKAGE_XORG7
 	help
 	  This enables the software buffer rendering engine. There is
 	  no hardware assist here.
