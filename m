From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 12:47:46 +0100
Subject: [Buildroot] [git commit] eeprog: fix homepage link
Message-ID: <20171231114756.47D9D827DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0748bd1baf60461425ec124fd4f3be68f2dd4d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current link leads to a 400 Bad Request error page.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eeprog/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eeprog/Config.in b/package/eeprog/Config.in
index ff313bd..73582c7 100644
--- a/package/eeprog/Config.in
+++ b/package/eeprog/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_EEPROG
 	help
 	  Simple tool to read/write i2c eeprom chips.
 
-	  http://codesink.org/eeprog.html
+	  http://www.codesink.org/eeprog.html
