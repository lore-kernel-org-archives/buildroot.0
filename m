From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jul 2019 22:44:34 +0200
Subject: [Buildroot] [PATCH 7/7] package/iprutils: add license hash
In-Reply-To: <20190728204434.12356-1-bernd.kuhls@t-online.de>
References: <20190728204434.12356-1-bernd.kuhls@t-online.de>
Message-ID: <20190728204434.12356-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iprutils/iprutils.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iprutils/iprutils.hash b/package/iprutils/iprutils.hash
index e5c1754696..423943b22d 100644
--- a/package/iprutils/iprutils.hash
+++ b/package/iprutils/iprutils.hash
@@ -3,3 +3,4 @@ md5 e4011051bba7470df3936cbba7dced98  iprutils-2.4.15.1.tar.gz
 sha1 ed6c362ee3c6bd9023ee60d0d1a1ce5543c27c41  iprutils-2.4.15.1.tar.gz
 # Locally computed:
 sha256 a733e65f8fb19565f2ef5191eaa2a14d816fabed0fc254ab4bbf1a4c7800ebe5  iprutils-2.4.15.1.tar.gz
+sha256 59b4179e61248aff9cd2d6ee4cd1dbbd0ef48836fe2eeee19f4b16459785104a  LICENSE
-- 
2.20.1
