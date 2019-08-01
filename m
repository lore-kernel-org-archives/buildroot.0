From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 09:35:19 +0200
Subject: [Buildroot] [git commit] package/sdl: add license hash
Message-ID: <20190801073838.23F40813D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a552fe8c2f36016b59678f0f62510524ff555dff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sdl/sdl.hash b/package/sdl/sdl.hash
index ad59b90042..2c46975dc3 100644
--- a/package/sdl/sdl.hash
+++ b/package/sdl/sdl.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256	d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00	SDL-1.2.15.tar.gz
+# Locally computed
+sha256	bb117c0fbd7f57f64170b690285d7df07c2371b578e3b3cd3aa2e1155ef461a0	COPYING
