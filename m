From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2015 23:57:16 +0200
Subject: [Buildroot] [git commit] grantlee: add hash
Message-ID: <20150601220249.88CEA81D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b27ca3da3d2931793513c05b3c16635eab83c72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grantlee/grantlee.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/grantlee/grantlee.hash b/package/grantlee/grantlee.hash
new file mode 100644
index 0000000..7f02bb3
--- /dev/null
+++ b/package/grantlee/grantlee.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature
+sha256	191809bf4c9b7ef877af0fd29345061c2372edfb4506aa7d5df5c71a570fa0ac	grantlee-0.5.1.tar.gz
+sha256	eaf22ba92e53b8eb5dd8bca045fe81b734d3445445ed9e0c1af2a0a7c375b161	grantlee-5.0.0.tar.gz
