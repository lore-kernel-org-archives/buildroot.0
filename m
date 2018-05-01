From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 21:13:59 +0200
Subject: [Buildroot] [PATCH 1/1] msmtp: add hash for license file
Message-ID: <20180501191359.5825-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
