From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 16:19:26 +0200
Subject: [Buildroot] [git commit] libbdplus: add hash for license file
Message-ID: <20180429142028.DC03E8821B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f1f0244cd93e4c3f259e08891c058a2ab68cf01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
