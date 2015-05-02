From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 15:11:01 +0200
Subject: [Buildroot] [git commit] package/xenomai: add hash file
Message-ID: <20150502131735.A0C71817AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f95a59c3a0a32ff0259d5d3fb31d9b1068bbc9b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that custom versions are properly excluded from the list, we can add
a hash for the version we package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
new file mode 100644
index 0000000..4d74472
--- /dev/null
+++ b/package/xenomai/xenomai.hash
@@ -0,0 +1,2 @@
+# Locally computed;
+sha256  b6ff723cb0f3b1c2c4e15bccfd114b248dea1b4164a0ac0e612815379ce7caf8  xenomai-2.6.4.tar.bz2
