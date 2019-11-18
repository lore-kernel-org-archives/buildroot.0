From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 13:52:43 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libsvgtiny: add
 license hash
Message-ID: <20191118124916.58A0F8F170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0e369b7f8b29f96597967077e0b009243b805b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a936e35f952028a915e49d6da005e9ca404e9206)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsvgtiny/libsvgtiny.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsvgtiny/libsvgtiny.hash b/package/libsvgtiny/libsvgtiny.hash
index fce3795352..86096cef3b 100644
--- a/package/libsvgtiny/libsvgtiny.hash
+++ b/package/libsvgtiny/libsvgtiny.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 082a2e8849f05e2364a942eec51a798d637c6eca44db8c73350a038ebd1fd268  libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06.tar.gz
+sha256 92b965c77be71661cae51425a6b40a5ca274f44cc13c723c90fb471a9a26a828  README
