From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue,  4 Feb 2020 07:20:14 +0100
Subject: [Buildroot] [PATCH 1/6] package/kodi-audioencoder-vorbis: add
 license file hash
Message-ID: <20200204062018.11658-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index aab1a6bcd7..ffdf138cf5 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 0bc1470ecef83ecc7e36239ef414abc49380394b551d35eb7bcc6704e74b469c  kodi-audioencoder-vorbis-2.0.3-Leia.tar.gz
+sha256 34c561f838b57d681bb795de0a26eacf610477a50cdca1ae707591ec607de42a  src/EncoderVorbis.cpp
-- 
2.20.1
