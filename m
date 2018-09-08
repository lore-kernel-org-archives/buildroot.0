From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:06:13 +0200
Subject: [Buildroot] [git commit] duktape: fix hash for license
Message-ID: <20180908130533.886848126A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e686e1e3797130c21a40fcb751aa17ad9daea746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4645456f715eccfce940a54e41a34a299adc152f
http://autobuild.buildroot.net/results/4ee6de3351c140bde4588252cebbf7cf9237e710

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/duktape/duktape.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/duktape/duktape.hash b/package/duktape/duktape.hash
index 0a819b4739..100af58d60 100644
--- a/package/duktape/duktape.hash
+++ b/package/duktape/duktape.hash
@@ -1,3 +1,3 @@
 # Locally computed:
 sha256	0df1c0a9d40bfae31733e5c44f0eabaeae59e0a2ebf7693ff68bbabd49aae331	duktape-v2.3.0.tar.gz
-sha256	5358498534dac625c89a69c10becf3dcc40f9af58e6b69ee358ebdf6934f49c6	LICENSE.txt
+sha256	9aabee442709a6e7652348b9617ae26d26da6b270c1f4b6fce4a1e746acb3df0	LICENSE.txt
