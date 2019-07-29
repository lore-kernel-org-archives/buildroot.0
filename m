From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Jul 2019 20:12:05 +0200
Subject: [Buildroot] [PATCH 04/11] package/bellagio: add license hash
In-Reply-To: <20190729181212.10341-1-bernd.kuhls@t-online.de>
References: <20190729181212.10341-1-bernd.kuhls@t-online.de>
Message-ID: <20190729181212.10341-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bellagio/bellagio.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bellagio/bellagio.hash b/package/bellagio/bellagio.hash
index 914dd7c369..bd95df0f19 100644
--- a/package/bellagio/bellagio.hash
+++ b/package/bellagio/bellagio.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c  libomxil-bellagio-0.9.3.tar.gz
+sha256  a3d4e451d72288a4f8819b734ef610926213c2ba97e512add8de2f30843505a6  COPYING
-- 
2.20.1
