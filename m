From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Dec 2016 21:57:12 +0100
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove perl-db-file
Message-ID: <20161227205712.8971-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package perl-db-file was removed today:
https://git.buildroot.net/buildroot/commit/?id=8546ff31c58b2501a69e49bc0f27a4ffa1d2ae08

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index abddf9df4..f3d54ef65 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -212,7 +212,6 @@ F:	package/mjpg-streamer/
 F:	package/mplayer/
 F:	package/perl-crypt-openssl-random/
 F:	package/perl-crypt-openssl-rsa/
-F:	package/perl-db-file/
 F:	package/perl-digest-sha1/
 F:	package/perl-encode-detect/
 F:	package/perl-encode-locale/
-- 
2.11.0
