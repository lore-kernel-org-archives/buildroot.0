From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jun 2018 10:02:45 +0200
Subject: [Buildroot] [git commit] package/cryptodev-linux: add an hash for
 the license file
Message-ID: <20180615080248.047318866D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c15ecc66de8811707f92ea2629b352010e8087ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a locally computed hash for the license file to track possible
updates.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptodev-linux/cryptodev-linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index ad7cb615e6..eeb481d6aa 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 994ed2f715dd3786f534d5215ae7ae4735b84cff28ea41080ff3501bf1503944 cryptodev-linux-f60aa08c63fc02780554a0a12180a478ca27d49f.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
