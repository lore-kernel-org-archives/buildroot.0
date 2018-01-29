From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 22:25:06 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] eeprog: fix homepage link
Message-ID: <20180129213708.AA1FA88014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac845908dd0de63f934b1ab398a1c2337923437e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The current link leads to a 400 Bad Request error page.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit b0748bd1baf60461425ec124fd4f3be68f2dd4d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eeprog/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eeprog/Config.in b/package/eeprog/Config.in
index ff313bdbae..73582c70f9 100644
--- a/package/eeprog/Config.in
+++ b/package/eeprog/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_EEPROG
 	help
 	  Simple tool to read/write i2c eeprom chips.
 
-	  http://codesink.org/eeprog.html
+	  http://www.codesink.org/eeprog.html
