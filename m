From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Nov 2016 08:28:01 +0100
Subject: [Buildroot] [git commit] bzip2: update homepage link
Message-ID: <20161129072857.05D507FCAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=737c804f1ca870c9a126443d47b3ce5021b974f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avoid a redirect.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bzip2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bzip2/Config.in b/package/bzip2/Config.in
index e8e03cf..dbc8249 100644
--- a/package/bzip2/Config.in
+++ b/package/bzip2/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_BZIP2
 	  available techniques, while being around twice as fast at
 	  compression and six times faster at decompression.
 
-	  http://sources.redhat.com/bzip2/
+	  http://www.bzip.org
