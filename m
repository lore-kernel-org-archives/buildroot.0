From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Sep 2018 07:22:35 +0300
Subject: [Buildroot] [PATCH 2/2] monkey: add license file hash
In-Reply-To: <f0cb06bc463b44e6fdfcbde7049e41c4814839ef.1537676555.git.baruch@tkos.co.il>
References: <f0cb06bc463b44e6fdfcbde7049e41c4814839ef.1537676555.git.baruch@tkos.co.il>
Message-ID: <2bd927dfa095f6ba3c368e25a526a7fdaa02c029.1537676555.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Morgan Delestre <m.delestre@sinters.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/monkey/monkey.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/monkey/monkey.hash b/package/monkey/monkey.hash
index 47e0e0db0060..83fc0def604a 100644
--- a/package/monkey/monkey.hash
+++ b/package/monkey/monkey.hash
@@ -1,3 +1,4 @@
 # md5 from http://monkey-project.com/releases/1.6/monkey-1.6.9.tar.gz.md5, sha256 locally computed:
 md5    c401734985a936ee07dbff5eca7d176a 				monkey-1.6.9.tar.gz
 sha256 f1122e89cda627123286542b0a18fcaa131cbe9d4f5dd897d9455157289148fb	monkey-1.6.9.tar.gz
+sha256 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594	LICENSE
-- 
2.19.0
