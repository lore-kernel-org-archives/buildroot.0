From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:04:04 +0200
Subject: [Buildroot] [git commit] nmap: add hash file
Message-ID: <20150713150417.409C980DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d46fefb0801af2f062581dbca8d134bf02b6002e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nmap/nmap.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
new file mode 100644
index 0000000..8c8da00
--- /dev/null
+++ b/package/nmap/nmap.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256 8fa11e9e203ce2d81a207db5ca4f110a525f6c01c1dd0018325a7112a51aa591 nmap-6.47.tar.bz2
