From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:17:07 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] DEVELOPERS: add myself as
 the ts5500 maintainer
Message-ID: <20180330213159.BA05D83EBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d51cb1fbdecdd83380c1284b4d63c746903118f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Add a new entry for myself listing the TS-5500 board directory and
defconfig file.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 79586d2ed5c47a59a3142678e9c414c74589194f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d1a4483940..f570d3ecab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1831,6 +1831,10 @@ F:	package/pixz/
 N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
 
+N:	Vivien Didelot <vivien.didelot@savoirfairelinux.com>
+F:	board/technologic/ts5500/
+F:	configs/ts5500_defconfig
+
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
 F:	package/zbar/
