From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Feb 2014 13:53:16 +0000
Subject: [Buildroot] [PATCH 1/2] matchbox-lib: rename patches to follow BR
	guidelines
Message-ID: <1392990797-40849-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...tch => matchbox-lib-0001-index-is-legacy.patch} |    0
 ...ng15.patch => matchbox-lib-0002-libpng15.patch} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/matchbox/matchbox-lib/{matchbox-lib-1.9-index-is-legacy.patch => matchbox-lib-0001-index-is-legacy.patch} (100%)
 rename package/matchbox/matchbox-lib/{matchbox-lib-1.9-libpng15.patch => matchbox-lib-0002-libpng15.patch} (100%)

diff --git a/package/matchbox/matchbox-lib/matchbox-lib-1.9-index-is-legacy.patch b/package/matchbox/matchbox-lib/matchbox-lib-0001-index-is-legacy.patch
similarity index 100%
rename from package/matchbox/matchbox-lib/matchbox-lib-1.9-index-is-legacy.patch
rename to package/matchbox/matchbox-lib/matchbox-lib-0001-index-is-legacy.patch
diff --git a/package/matchbox/matchbox-lib/matchbox-lib-1.9-libpng15.patch b/package/matchbox/matchbox-lib/matchbox-lib-0002-libpng15.patch
similarity index 100%
rename from package/matchbox/matchbox-lib/matchbox-lib-1.9-libpng15.patch
rename to package/matchbox/matchbox-lib/matchbox-lib-0002-libpng15.patch
-- 
1.7.1
