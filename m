From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 22 Oct 2019 22:12:20 +0200
Subject: [Buildroot] [git commit] package/ofono: remove double empty line in
 .mk file
Message-ID: <20191022200628.570DA83CDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce81f840cb0b426cd37e592faffc42cc7e701963
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Detected by check-package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ofono/ofono.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 756998687b..95a6c8c599 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -49,5 +49,4 @@ else
 OFONO_CONF_OPTS += --disable-bluetooth
 endif
 
-
 $(eval $(autotools-package))
