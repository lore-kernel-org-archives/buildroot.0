From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 19:02:03 +0200
Subject: [Buildroot] [git commit] libcgicc: add hash of license files
Message-ID: <20180428170208.ED06582DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=371204253273ba2984104e2c7a59f6afb657cd81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcgicc/libcgicc.hash | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcgicc/libcgicc.hash b/package/libcgicc/libcgicc.hash
index eb99115833..6fd19e305c 100644
--- a/package/libcgicc/libcgicc.hash
+++ b/package/libcgicc/libcgicc.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256	2a17b976248de03447f9e36d6ce18a80749990d8543e2dfeea09c413eb67f7f0	cgicc-3.2.19.tar.gz
+
+# Hash for license files:
+sha256  a2e480f5e8afd7c587a3c0ac2ed3b73ed4b10fa3a553dea26e7b661c7cedda72  COPYING.LIB
+sha256  0fd15977dc962abf3eced509b1cf5356f9784939742d67a635671141023a11da  COPYING.DOC
