From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 22 Jan 2020 23:32:30 +0100
Subject: [Buildroot] [git commit] package/axel: add hash for license file
Message-ID: <20200122222228.11DA58386E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c1223e637c870334148031dc26d6f5002e0ff58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/axel/axel.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/axel/axel.hash b/package/axel/axel.hash
index e7c128ed76..f9c5526f88 100644
--- a/package/axel/axel.hash
+++ b/package/axel/axel.hash
@@ -1 +1,3 @@
+# locally computed
 sha256 24ab549021bdfca01ad5e8e95b706869dd30fe9ab1043da4cbb9dff89edc267d  axel-2.17.6.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
