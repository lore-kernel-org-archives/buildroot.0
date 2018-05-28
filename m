From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:05:35 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libcap: add license hash
Message-ID: <20180528142834.1C84D7FD65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e883027c015035182d650d354cd0bc959651a4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2a05731aa5213879bd0a90ac076521f3cbeb28d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap/libcap.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index a1dcd62b3c..2d3aee591d 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,2 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
 sha256	693c8ac51e983ee678205571ef272439d83afe62dd8e424ea14ad9790bc35162  libcap-2.25.tar.xz
+
+# Hash for license file:
+sha256	088cabde4662b4121258d298b0b2967bc1abffa134457ed9bc4a359685ab92bc  License
