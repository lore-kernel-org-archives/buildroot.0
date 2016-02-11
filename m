From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2016 23:20:38 +0100
Subject: [Buildroot] [git commit] skeleton: Recreate /var/run symlink
Message-ID: <20160211222655.380A48192A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25043d8a311fc1425fb392d7716a42a0a4cec9e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was the only one with a trailing slash, it's only for coherence's
sake.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/var/run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/skeleton/var/run b/system/skeleton/var/run
index d1a2745..84ba55b 120000
--- a/system/skeleton/var/run
+++ b/system/skeleton/var/run
@@ -1 +1 @@
-../run/
\ No newline at end of file
+../run
\ No newline at end of file
