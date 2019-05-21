From: Paulo Serra Filho <ptvsf@cesar.org.br>
Date: Tue, 21 May 2019 15:27:53 -0300
Subject: [Buildroot] [PATCH 1/1] package/genimage: add COPYING sha256 hash
In-Reply-To: <1558463273-27537-1-git-send-email-ptvsf@cesar.org.br>
References: <1558463273-27537-1-git-send-email-ptvsf@cesar.org.br>
Message-ID: <1558463273-27537-2-git-send-email-ptvsf@cesar.org.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulo Serra Filho <ptvsf@cesar.org.br>
---
 package/genimage/genimage.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index dedb32b..c1f2270 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	2ee024bfb2ec157651b86f3365d138ee013dcc48277d86e1eed6f3285a67b532	genimage-11.tar.xz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
-- 
2.7.4
