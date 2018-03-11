From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 09:48:48 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add myself as the ts5500
 maintainer
Message-ID: <20180311085013.E69EF81217@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79586d2ed5c47a59a3142678e9c414c74589194f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new entry for myself listing the TS-5500 board directory and
defconfig file.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a2bfdabb88..e3c4a9c824 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1859,6 +1859,10 @@ F:	package/pixz/
 N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
 
+N:	Vivien Didelot <vivien.didelot@savoirfairelinux.com>
+F:	board/technologic/ts5500/
+F:	configs/ts5500_defconfig
+
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
 F:	package/zbar/
