From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 19:12:49 +0100
Subject: [Buildroot] [git commit] libplist: add a hash file
Message-ID: <20151201232124.16A4581D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30ef60be787d2ed94af14b6f2daebf181054ddbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplist/libplist.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libplist/libplist.hash b/package/libplist/libplist.hash
new file mode 100644
index 0000000..06d1b16
--- /dev/null
+++ b/package/libplist/libplist.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 0effdedcb3de128c4930d8c03a3854c74c426c16728b8ab5f0a5b6bdc0b644be  libplist-1.12.tar.bz2
