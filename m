From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Jul 2019 20:12:12 +0200
Subject: [Buildroot] [PATCH 11/11] package/ltris: add license hash
In-Reply-To: <20190729181212.10341-1-bernd.kuhls@t-online.de>
References: <20190729181212.10341-1-bernd.kuhls@t-online.de>
Message-ID: <20190729181212.10341-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ltris/ltris.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ltris/ltris.hash b/package/ltris/ltris.hash
index 5c0fcde7a0..25fc04c6cb 100644
--- a/package/ltris/ltris.hash
+++ b/package/ltris/ltris.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  8f6a9e7719d22004aee153db29ffd9ca41c7a6cd87fc791591994eecc2e625a1  ltris-1.0.19.tar.gz
+sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
-- 
2.20.1
