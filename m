From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 Jan 2021 13:54:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/leptonica: fix legal info
In-Reply-To: <20210131125457.3810589-1-fontaine.fabrice@gmail.com>
References: <20210131125457.3810589-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131125457.3810589-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5159f656608cb1a136c0fed8372ffe8ec3a75b33 forgot to update hash of
leptonica-license.txt which changed due to an update in year:
https://github.com/DanBloomberg/leptonica/commit/8193d341dd56aff5fcbbaab8832e7b38f2fede0a

Fixes:
 - http://autobuild.buildroot.org/results/1644512ca52eed1b69d65d3ca145ec0d253888a8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/leptonica/leptonica.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 213716705b..6ef1a09122 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
 sha256  ec9c46c2aefbb960fb6a6b7f800fe39de48343437b6ce08e30a8d9688ed14ba4  leptonica-1.80.0.tar.gz
-sha256  ca0ac11c7c0acad9599d54990942cc11c9f6d9b569f1a360d774a628819c3518  leptonica-license.txt
+sha256  87829abb5bbb00b55a107365da89e9a33f86c4250169e5a1e5588505be7d5806  leptonica-license.txt
-- 
2.29.2
