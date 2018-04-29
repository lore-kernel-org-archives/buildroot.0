From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 14:09:49 +0200
Subject: [Buildroot] [PATCH 1/1] libbdplus: add hash for license file
Message-ID: <20180429120949.5188-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbdplus/libbdplus.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libbdplus/libbdplus.hash b/package/libbdplus/libbdplus.hash
index 552cd71c89..6abc0e4970 100644
--- a/package/libbdplus/libbdplus.hash
+++ b/package/libbdplus/libbdplus.hash
@@ -1,2 +1,5 @@
 # From http://download.videolan.org/pub/videolan/libbdplus/0.1.2/libbdplus-0.1.2.tar.bz2.sha512
 sha512	e00e7bc9f52b9275646593b753ba646b052255be94a7241965f4dbe4734f8f6a072973ed4b9997957f939236b0633897c295749f79e232188430795be5b5087b	libbdplus-0.1.2.tar.bz2
+
+# Hash for license file:
+sha256	592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c	COPYING
-- 
2.14.1
