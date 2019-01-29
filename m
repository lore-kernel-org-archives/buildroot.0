From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 19:25:36 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/rp-pppoe: update
 website url
Message-ID: <20190129182446.2C26D81501@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=243493ee022d74e9d80bf8eafeaaafa1d17c018c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

The website for rp-pppoe moved from Roaring Penguin's main site to
a personal project page.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 02af305b5c94a484ef0a393a722ec88792d9aa6f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rp-pppoe/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index 8a692711b9..12f981d8c7 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -16,4 +16,4 @@ config BR2_PACKAGE_RP_PPPOE
 	  devices. Otherwise the normal client functionality already
 	  exists in the pppd package (and kernel).
 
-	  http://www.roaringpenguin.com/pppoe.html
+	  https://dianne.skoll.ca/projects/rp-pppoe/
