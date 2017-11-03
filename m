From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:52 +0100
Subject: [Buildroot] [PATCH 17/31] package/libtool: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-18-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libtool/libtool.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtool/libtool.hash b/package/libtool/libtool.hash
index baaac61232..9147cd4031 100644
--- a/package/libtool/libtool.hash
+++ b/package/libtool/libtool.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
 sha256	7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f	libtool-2.4.6.tar.xz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
-- 
2.15.0
