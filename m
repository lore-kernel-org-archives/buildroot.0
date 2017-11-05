From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:45:05 +0100
Subject: [Buildroot] [git commit] package/clapack: add license hash
Message-ID: <20171105163751.5AF52811C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd5642211691c22127f88039c22110e93b318499
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/clapack/clapack.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/clapack/clapack.hash b/package/clapack/clapack.hash
index 08657fc..ad586fa 100644
--- a/package/clapack/clapack.hash
+++ b/package/clapack/clapack.hash
@@ -1,2 +1,5 @@
 # Locally calculated
 sha256 0b3f782bc24845d85f36bafbff0f2f1384dc72df730fda4e7924ec1a70baca5a clapack-3.2.1-CMAKE.tgz
+# License files, locally calculated
+sha256 23014869214a231525b38c39fdb5f82364fa24154ac80fdcab2a79671460fd09 COPYING
+sha256 44561c447e91203ddc747beeca5cc2794d95ee982c17c578670e4f0408bc3904 F2CLIBS/libf2c/Notice
