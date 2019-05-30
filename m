From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:25:58 +0200
Subject: [Buildroot] [git commit branch/next] package/gperf: add hash for
 license file
Message-ID: <20190530223346.988B18E72C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4190996b53c900ee02a7589847dc9f94ab350d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gperf/gperf.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
index 370235c627..21c76605b5 100644
--- a/package/gperf/gperf.hash
+++ b/package/gperf/gperf.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256	767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e	gperf-3.0.4.tar.gz
+
+# Locally calculated
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
