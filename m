From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 14:03:33 +0100
Subject: [Buildroot] [git commit] package/xenomai: drop empty line at end of
 .hash file
Message-ID: <20190317130057.1D9688EC66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aab752e727a3aa4639635e43686562e8d90510b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

package/xenomai/xenomai.hash:3: empty line at end of file

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xenomai/xenomai.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index e275b7424a..cd518e20e9 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,3 +1,2 @@
 # Locally computed;
 sha256 c373261ddb8280d9d7078cdd9cd9646dfb7d70d8cd3aa9693d9148f03990d711  xenomai-3.0.8.tar.bz2
-
