From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 18:26:26 -0400
Subject: [Buildroot] [PATCH 14/22] package/x11r7/xfont_font-util: add
 license hash
In-Reply-To: <20190701222634.104301-1-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
Message-ID: <20190701222634.104301-14-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/x11r7/xfont_font-util/xfont_font-util.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.hash b/package/x11r7/xfont_font-util/xfont_font-util.hash
index 04ada91da1..ef5f61d4ef 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.hash
+++ b/package/x11r7/xfont_font-util/xfont_font-util.hash
@@ -1,3 +1,6 @@
 # From http://lists.x.org/archives/xorg-announce/2015-March/002546.html
 sha1	0b16add3637c64b0bbaf1dd223b71b0421100c20				font-util-1.3.1.tar.bz2
 sha256	aa7ebdb0715106dd255082f2310dbaa2cd7e225957c2a77d719720c7cc92b921	font-util-1.3.1.tar.bz2
+
+# Locally calculated
+sha256	ce16c3ee6f2a38db6870b66bdb54fce9dcf24acd1161840789e321f6faa1251c	COPYING
-- 
2.21.0
