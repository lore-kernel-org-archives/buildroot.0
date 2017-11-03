From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:37:02 +0100
Subject: [Buildroot] [PATCH 27/31] package/scrub: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-28-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/scrub/scrub.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/scrub/scrub.hash b/package/scrub/scrub.hash
index 42f7b2fab9..c0110c1f9d 100644
--- a/package/scrub/scrub.hash
+++ b/package/scrub/scrub.hash
@@ -1,2 +1,4 @@
 # Locally computed
 sha256  838b061b2e1932b342fb9695c5579cdff5d2d72506cb41d6d8032eba18aed969  scrub-2.6.1.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  f76abbfb80cde1036cb553cdecb08bb846a48e33c91ef56c0f494172fd407f33  DISCLAIMER
-- 
2.15.0
