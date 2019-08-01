From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 10:46:19 +0200
Subject: [Buildroot] [git commit] package/iprutils: add license hash
Message-ID: <20190801084417.79DCE80DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d81a742b382e5f7198b085c0d58a327e759059c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
