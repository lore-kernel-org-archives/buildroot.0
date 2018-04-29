From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 19:27:30 +0200
Subject: [Buildroot] [git commit] libee: add hash for license file
Message-ID: <20180429173109.E60637FBCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=161182d182b97d74574aed337ee47ee8f966491c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libee/libee.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libee/libee.hash b/package/libee/libee.hash
index b70242aa29..5ad47e162c 100644
--- a/package/libee/libee.hash
+++ b/package/libee/libee.hash
@@ -1,2 +1,5 @@
 # From http://www.libee.org/download/libee-0-4-1/
 md5	7bbf4160876c12db6193c06e2badedb2	libee-0.4.1.tar.gz
+
+# Hash for license file:
+sha256	275fecbf835387e042ba96884f0f05356a485a6ea8449b2c5295cc11652ad439	COPYING
