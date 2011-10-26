From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Oct 2011 11:11:03 +0200
Subject: [Buildroot] [git commit] securetty: update to add ttySC for sh4
Message-ID: <20111026091241.8E6208F061@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f5df8bcfe4c59997329c1ef8cdcf834894679a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/securetty |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/securetty b/fs/skeleton/etc/securetty
index fd0ec8e..4ab956f 100644
--- a/fs/skeleton/etc/securetty
+++ b/fs/skeleton/etc/securetty
@@ -40,3 +40,5 @@ ttyO3
 ttyAM0
 ttyAM1
 ttyAM2
+ttySC0
+ttySC1
