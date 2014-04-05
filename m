From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 18:31:51 +0200
Subject: [Buildroot] [git commit] system/skeleton: add mail group
Message-ID: <20140405163218.5B3869C5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa7697dc2b04bf3e35d5d456abbe20a93c650f2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/group |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index 864d1db..85a1fa2 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -6,6 +6,7 @@ adm:x:4:
 tty:x:5:
 disk:x:6:
 lp:x:7:
+mail:x:8:
 kmem:x:9:
 wheel:x:10:root
 cdrom:x:11:
