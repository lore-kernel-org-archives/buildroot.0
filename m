From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:47:05 +0100
Subject: [Buildroot] [git commit] package/dt: add license hash
Message-ID: <20191027114054.6EF4D890A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d991821ad62cfbfee4f22eeb4d5386fea663e8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it, drop the "Calculated based on the hash above" comment,
which doesn't make any sense: you don't calculate a hash based on
another hash.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dt/dt.hash | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dt/dt.hash b/package/dt/dt.hash
index 7cd8c643e1..9c1102579d 100644
--- a/package/dt/dt.hash
+++ b/package/dt/dt.hash
@@ -1,5 +1,7 @@
 # From http://pkgs.fedoraproject.org/repo/pkgs/dt/dt-source-v18.32.tar.gz
 # (directory name is md5 hash)
 md5	3054aeaaba047a1dbe90c2132a382ee2	dt-source-v18.32.tar.gz
-# Calculated based on the hash above
+
+# Locally calculated
 sha256	10d164676e918a4d07f233bcd11e4cb6bfd1052c996182cd1827ccd0c063fcc6	dt-source-v18.32.tar.gz
+sha256  49f47f20de4b44dc3505ed0cc55bfbfe0fc3e41956ab546f1eeedcf554def54c	LICENSE
