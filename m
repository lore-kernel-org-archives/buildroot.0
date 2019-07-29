From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Jul 2019 20:12:09 +0200
Subject: [Buildroot] [PATCH 08/11] package/libsvgtiny: add license hash
In-Reply-To: <20190729181212.10341-1-bernd.kuhls@t-online.de>
References: <20190729181212.10341-1-bernd.kuhls@t-online.de>
Message-ID: <20190729181212.10341-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.20.1
