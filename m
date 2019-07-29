From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Jul 2019 20:12:08 +0200
Subject: [Buildroot] [PATCH 07/11] package/sdl: add license hash
In-Reply-To: <20190729181212.10341-1-bernd.kuhls@t-online.de>
References: <20190729181212.10341-1-bernd.kuhls@t-online.de>
Message-ID: <20190729181212.10341-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.20.1
