From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:37:01 +0100
Subject: [Buildroot] [PATCH 26/31] package/python: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-27-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/python/python.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python/python.hash b/package/python/python.hash
index 3f64b83611..e30cbaa9fe 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -2,3 +2,4 @@
 md5 1f6db41ad91d9eb0a6f0c769b8613c5b  Python-2.7.14.tar.xz
 # Locally calculated
 sha256 71ffb26e09e78650e424929b2b457b9c912ac216576e6bd9e7d204ed03296a66  Python-2.7.14.tar.xz
+sha256 d2d17b17388da74dc9c6bdbf78eb7237432c3f8a0c87852df740ec99de2ec680  LICENSE
-- 
2.15.0
