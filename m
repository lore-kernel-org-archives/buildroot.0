From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 16:34:27 +0100
Subject: [Buildroot] [git commit] whetstone: add a hash file
Message-ID: <20151217161946.786FB8230B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6a4e95233f56c5eefa16d2e542db1ce5ed70285
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/whetstone/whetstone.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/whetstone/whetstone.hash b/package/whetstone/whetstone.hash
new file mode 100644
index 0000000..db9bbb4
--- /dev/null
+++ b/package/whetstone/whetstone.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 333e4ceca042c146f63eec605573d16ae8b07166cbc44a17bec1ea97c6f1efbf  whetstone.c
