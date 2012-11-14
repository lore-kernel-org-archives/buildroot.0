From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:38:52 +0100
Subject: [Buildroot] [git commit] which: add license info
Message-ID: <20121114214737.36E5A99B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36581a48557a62b209e68a5eec30b25c3eb9ce25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/which/which.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/which/which.mk b/package/which/which.mk
index e7ebc7f..6e2dce6 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -6,5 +6,7 @@
 
 WHICH_VERSION = 2.20
 WHICH_SITE = http://carlo17.home.xs4all.nl/which
+WHICH_LICENSE = GPLv3+
+WHICH_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
