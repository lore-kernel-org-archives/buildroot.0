From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Apr 2019 09:13:26 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: stop monitoring aer-inject
Message-ID: <20190406070959.ADF4B89129@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c45394c1b03dd79f39a017a14922a5d1f82de50b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I left DATACOM and will unlikely have access to the hardware required to
test the package.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8bb7457985..01cb34057b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -433,7 +433,6 @@ N:	Carlo Caione <carlo.caione@gmail.com>
 F:	package/sunxi-boards/
 
 N:	Carlos Santos <unixmania@gmail.com>
-F:	package/aer-inject/
 F:	package/busybox/
 F:	package/gtest/
 F:	package/initscripts/
