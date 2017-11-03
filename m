From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:36:43 +0100
Subject: [Buildroot] [PATCH 08/31] package/check: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-9-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/check/check.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/check/check.hash b/package/check/check.hash
index f0c02ba998..ffbab228d0 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256	24f7a48aae6b74755bcbe964ce8bc7240f6ced2141f8d9cf480bc3b3de0d5616	check-0.11.0.tar.gz
+sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING.LESSER
-- 
2.15.0
