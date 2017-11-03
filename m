From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:37:00 +0100
Subject: [Buildroot] [PATCH 25/31] package/python-numpy: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-26-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/python-numpy/python-numpy.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 6e76c62e7d..78facce597 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,2 +1,4 @@
 # Copied from https://github.com/numpy/numpy/releases/tag/v1.13.3
 sha256	4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df72d8094	numpy-1.13.3.tar.gz
+# Locally computed
+sha256	94eebc7c8f86a287c1e9146ed52ebcde88183806d848d8c66e0e52d1aebf3b13	LICENSE.txt
-- 
2.15.0
