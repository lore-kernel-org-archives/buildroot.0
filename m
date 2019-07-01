From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:16 -0400
Subject: [Buildroot] [PATCH 04/22] package/libsig: add license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsigc/libsigc.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index a630534e84..4bdebc5ed8 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,2 +1,5 @@
 # From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.10/libsigc++-2.10.0.sha256sum
 sha256	f843d6346260bfcb4426259e314512b99e296e8ca241d771d21ac64f28298d81	libsigc++-2.10.0.tar.xz
+
+# Locally calculated
+sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING
-- 
2.21.0
