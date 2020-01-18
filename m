From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sat, 18 Jan 2020 14:10:13 +0100
Subject: [Buildroot] [PATCH 2/2] package/micropython: add hash for license
 file
In-Reply-To: <1579353013-3395-1-git-send-email-pjtexier@koncepto.io>
References: <1579353013-3395-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <1579353013-3395-2-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/micropython/micropython.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index a889044..49fd903 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,3 @@
 #locally computed
 sha256 330cd32c7b67cb6b531d158eabcf68af3a7d7ad7b5a4b0ce3c73da3d241da6a2  micropython-1.12.tar.gz
+sha256 afde3432122205e8e08d615fcb920aca58631c52b6c0c01813854287a457b298  LICENSE
-- 
2.7.4
