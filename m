From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:17:06 +0100
Subject: [Buildroot] [git commit] vboot-utils: add hash
Message-ID: <20170321221730.9FEB5819D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4044bb2113a2caeafff3223f47ee11cc32881dbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vboot-utils had a hash file, but is says "none" because it is a git
download.  Since our git downloads are not reproducible, we can actually
add a hash.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vboot-utils/vboot-utils.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index e161423..9a5b334 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,2 +1,2 @@
-# Git shapshot
-none	xxx	bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
+# Locally computed
+sha256  e119782a374655117e3d9a4e667b0056c76961c4593ba907f860d1310f6fbc2a  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
