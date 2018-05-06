From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 May 2018 11:56:51 +0200
Subject: [Buildroot] [PATCH 1/1] libnetfilter_acct: add hash for license file
Message-ID: <20180506095651.5267-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnetfilter_acct/libnetfilter_acct.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libnetfilter_acct/libnetfilter_acct.hash b/package/libnetfilter_acct/libnetfilter_acct.hash
index 7c38664612..0d37c43677 100644
--- a/package/libnetfilter_acct/libnetfilter_acct.hash
+++ b/package/libnetfilter_acct/libnetfilter_acct.hash
@@ -1,3 +1,6 @@
 # From ftp://ftp.netfilter.org/pub/libnetfilter_acct/libnetfilter_acct-1.0.3.tar.bz2.{md5sum,sha1sum}
 md5	814b2972b2f5c740ff87510bc109168b	libnetfilter_acct-1.0.3.tar.bz2
 sha1	4b9073e4aa989b0f000c8da1ab01b22fceed52b2	libnetfilter_acct-1.0.3.tar.bz2
+
+# Hash for license file:
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
-- 
2.14.1
