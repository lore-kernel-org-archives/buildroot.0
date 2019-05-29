From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 23:35:31 -0400
Subject: [Buildroot] [PATCH 13/19] package/ncurses: add hash for license file
In-Reply-To: <20190529033537.128311-1-aduskett@gmail.com>
References: <20190529033537.128311-1-aduskett@gmail.com>
Message-ID: <20190529033537.128311-14-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/ncurses/ncurses.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 045625ae3b..f6683959fd 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256	aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17	ncurses-6.1.tar.gz
+
+# Locally calculated
+sha256	3c7bc1dd475a5e5dcc7bdf13268a0313ff69e3765689444eb95b5893f61b3d1e	README
-- 
2.21.0
