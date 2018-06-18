From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jun 2018 20:20:40 +0200
Subject: [Buildroot] [git commit] lvm2: add license hashes
Message-ID: <20180618181921.53D71800CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70dc00e1c22626a57de383d534f1788a4d44ec47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 9f7a6c6f51..b0dfcfcef3 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,2 +1,5 @@
 # From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
 sha512 c2ea8beafe006abf9282f51ec98600fd0ebff816d53c10ecbb19bbf336ada4825135cf9c92ccd364afb18f8b1d7e163eff5bdec8dfdd70dfb9ba45db2f6bdd5e  LVM2.2.02.173.tgz
+# Locally computed sha256 checksums
+sha256 e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
+sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
