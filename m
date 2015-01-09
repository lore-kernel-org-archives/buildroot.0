From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Jan 2015 03:44:14 -0300
Subject: [Buildroot] [PATCH] xz: fix stray hash
Message-ID: <1420785854-29928-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xz/xz.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index f76b9ac..9a5a9ff 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  5962fe32e0b42c7065b4410b7d8ffbf2895e197e97d410c4fc374ea0d7610a14  xz-5.2.0.tar.xz
+sha256  f7357d7455a1670229b3cca021da71dd5d13b789db62743c20624bdffc9cc4a5  xz-5.2.0.tar.bz2
-- 
2.0.5
