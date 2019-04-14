From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 22:23:22 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] DEVELOPERS: stop
 monitoring aer-inject
Message-ID: <20190414202935.487AA81597@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=461465b4ecd54b374b5ac3cd64cc4e723d5a307a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

I left DATACOM and will unlikely have access to the hardware required to
test the package.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c45394c1b03dd79f39a017a14922a5d1f82de50b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4082007a4c..1a54fa5875 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -421,7 +421,6 @@ N:	Carlo Caione <carlo.caione@gmail.com>
 F:	package/sunxi-boards/
 
 N:	Carlos Santos <unixmania@gmail.com>
-F:	package/aer-inject/
 F:	package/busybox/
 F:	package/gtest/
 F:	package/initscripts/
