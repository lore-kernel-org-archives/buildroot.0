From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 08:42:00 +0200
Subject: [Buildroot] [PATCH 17/18] package/ncurses: add license hash
In-Reply-To: <20190804064201.10667-1-bernd.kuhls@t-online.de>
References: <20190804064201.10667-1-bernd.kuhls@t-online.de>
Message-ID: <20190804064201.10667-17-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ncurses/ncurses.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 045625ae3b..cb6ef6b863 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256	aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17	ncurses-6.1.tar.gz
+# Locally computed
+sha256 3c7bc1dd475a5e5dcc7bdf13268a0313ff69e3765689444eb95b5893f61b3d1e  README
-- 
2.20.1
