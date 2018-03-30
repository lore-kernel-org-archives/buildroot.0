From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:47:38 +0200
Subject: [Buildroot] [git commit] opus-tools: add hash for license file
Message-ID: <20180330194951.7E3DB83EF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ccd6958d54d194a623f23debeefce15c6aaccc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus-tools/opus-tools.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/opus-tools/opus-tools.hash b/package/opus-tools/opus-tools.hash
index 185c94ce75..c7759e559f 100644
--- a/package/opus-tools/opus-tools.hash
+++ b/package/opus-tools/opus-tools.hash
@@ -1,2 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
 sha256 a2357532d19471b70666e0e0ec17d514246d8b3cb2eb168f68bb0f6fd372b28c  opus-tools-0.1.10.tar.gz
+
+# Hash for license file
+sha256 88021117568c64038175d7fb3b8286056f7cdb54f09dc806578f6bd9342c62cc  COPYING
