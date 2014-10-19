From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:35:26 +0200
Subject: [Buildroot] [git commit] rsync: add hash file
Message-ID: <20141019153637.74630AF9BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1cd684e63fd230e92879add07f5896306bbd22b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsync/rsync.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
new file mode 100644
index 0000000..032047d
--- /dev/null
+++ b/package/rsync/rsync.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	7de4364fcf5fe42f3bdb514417f1c40d10bbca896abe7e7f2c581c6ea08a2621	rsync-3.1.1.tar.gz
