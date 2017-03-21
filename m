From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:07:04 +0100
Subject: [Buildroot] [PATCH 08/16] vboot-utils: add hash
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-9-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vboot-utils had a hash file, but is says "none" because it is a git
download.  Since our git downloads are not reproducible, we can actually
add a hash.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/vboot-utils/vboot-utils.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index e16142389b..9a5b334324 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,2 +1,2 @@
-# Git shapshot
-none	xxx	bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
+# Locally computed
+sha256  e119782a374655117e3d9a4e667b0056c76961c4593ba907f860d1310f6fbc2a  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656.tar.gz
-- 
2.11.0
