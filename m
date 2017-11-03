From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:55 +0100
Subject: [Buildroot] [PATCH 20/31] package/nginx: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-21-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/nginx/nginx.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 22e4007b5f..3f323b7d55 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
 sha256	8793bf426485a30f91021b6b945a9fd8a84d87d17b566562c3797aba8fac76fb	nginx-1.12.1.tar.gz
+sha256	75820469c890db641e54078df018e497fde0542211aa704e15320316a2175780	LICENSE
-- 
2.15.0
