From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:25:53 +0200
Subject: [Buildroot] [git commit] msmtp: add hash for license file
Message-ID: <20180501192706.6018E8A637@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a16f46148e0fdc4bae6799f22104b57d8ea7d9a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/msmtp/msmtp.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 10d6cea6ad..0b66cec862 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -4,3 +4,6 @@ sha1	f997f40dfb3f882df837cfd9a63bd4d271dcdc41	msmtp-1.6.6.tar.xz
 # Locally calculated after checking signature
 # http://downloads.sourceforge.net/project/msmtp/msmtp/1.6.6/msmtp-1.6.6.tar.xz.sig
 sha256	da15db1f62bd0201fce5310adb89c86188be91cd745b7cb3b62b81a501e7fb5e	msmtp-1.6.6.tar.xz
+
+# Hash for license file:
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
