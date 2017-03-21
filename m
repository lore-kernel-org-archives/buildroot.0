From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 23:42:17 +0100
Subject: [Buildroot] [PATCH] vboot-utils: correct hash
Message-ID: <20170321224217.28898-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I created the hash based on an old tarball in my dl dir which was
generated without the sorting introduced in commit 4f87aa7db5ee. This
time it is based on a properly created tarball.

Reported-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/vboot-utils/vboot-utils.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index 9a5b334324..4ff6c39807 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  e119782a374655117e3d9a4e667b0056c76961c4593ba907f860d1310f6fbc2a  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
+sha256  d95b64b1f1de4a3ffa5c2e446d7c8e92aa197aee10de24206b2ea2deb5a8b947  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
-- 
2.11.0
